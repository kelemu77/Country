import 'package:dio/dio.dart';
import '../../../core/constants/api_constants.dart';
import '../../models/country_details_model.dart';
import '../../models/country_summary_model.dart';

abstract class CountryRemoteDataSource {
  Future<List<CountrySummaryModel>> getAllCountries();
  Future<List<CountrySummaryModel>> searchCountries(String name);
  Future<CountryDetailsModel> getCountryDetails(String code);
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final Dio dio;

  CountryRemoteDataSourceImpl(this.dio);

  @override
  Future<List<CountrySummaryModel>> getAllCountries() async {
    try {
      final response = await dio.get(ApiConstants.getAllCountries());
      // Accept both 200 (OK) and 304 (Not Modified from cache) as valid responses
      if ((response.statusCode == 200 || response.statusCode == 304) &&
          response.data != null) {
        final data = response.data;
        if (data is List) {
          try {
            return data.map((json) {
              if (json is Map<String, dynamic>) {
                return CountrySummaryModel.fromJson(json);
              }
              throw FormatException(
                'Invalid JSON format: expected Map, got ${json.runtimeType}',
              );
            }).toList();
          } catch (e) {
            throw Exception('Failed to parse countries: ${e.toString()}');
          }
        } else {
          throw Exception(
            'Invalid response format: expected List, got ${data.runtimeType}',
          );
        }
      }
      throw Exception(
        'Failed to load countries: Status ${response.statusCode}, data: ${response.data != null ? 'present' : 'null'}',
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'Failed to load countries: HTTP ${e.response?.statusCode} - ${e.response?.statusMessage ?? 'Unknown error'}',
        );
      }
      throw Exception(
        'Network error: ${e.message ?? 'No internet connection'}',
      );
    } catch (e) {
      throw Exception('Failed to load countries: ${e.toString()}');
    }
  }

  @override
  Future<List<CountrySummaryModel>> searchCountries(String name) async {
    try {
      final response = await dio.get(
        ApiConstants.searchByName(name),
        options: Options(
          validateStatus: (status) {
            // Accept 200, 304 (cached), and 404 (not found) as valid statuses
            return status != null &&
                (status == 200 || status == 304 || status == 404);
          },
        ),
      );

      // Handle 404 - no countries found
      if (response.statusCode == 404) {
        return [];
      }

      // Accept both 200 (OK) and 304 (Not Modified from cache) as valid responses
      if ((response.statusCode == 200 || response.statusCode == 304) &&
          response.data != null) {
        final data = response.data;
        if (data is List) {
          try {
            return data
                .map((json) {
                  if (json is Map<String, dynamic>) {
                    return CountrySummaryModel.fromJson(json);
                  }
                  return null;
                })
                .whereType<CountrySummaryModel>()
                .toList();
          } catch (e) {
            return [];
          }
        }
      }
      return [];
    } on DioException catch (e) {
      // Handle 404 explicitly - no countries found
      if (e.response?.statusCode == 404) {
        return [];
      }
      // Handle other network errors
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception(
          'Network error: ${e.message ?? 'No internet connection'}',
        );
      }
      throw Exception('Search failed: ${e.message ?? 'Network error'}');
    } catch (e) {
      // For any other errors, return empty list (no results found)
      return [];
    }
  }

  @override
  Future<CountryDetailsModel> getCountryDetails(String code) async {
    try {
      final response = await dio.get(ApiConstants.getCountryByCode(code));
      // Accept both 200 (OK) and 304 (Not Modified from cache) as valid responses
      if ((response.statusCode == 200 || response.statusCode == 304) &&
          response.data != null) {
        final data = response.data;
        try {
          if (data is List && data.isNotEmpty) {
            final firstItem = data[0];
            if (firstItem is Map<String, dynamic>) {
              return CountryDetailsModel.fromJson(firstItem);
            }
          } else if (data is Map<String, dynamic>) {
            return CountryDetailsModel.fromJson(data);
          }
          throw FormatException(
            'Invalid response format: expected List or Map, got ${data.runtimeType}',
          );
        } catch (e) {
          throw Exception('Failed to parse country details: ${e.toString()}');
        }
      }
      throw Exception(
        'Failed to load country details: Status ${response.statusCode}, data: ${response.data != null ? 'present' : 'null'}',
      );
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(
          'Failed to load details: HTTP ${e.response?.statusCode} - ${e.response?.statusMessage ?? 'Unknown error'}',
        );
      }
      throw Exception(
        'Network error: ${e.message ?? 'No internet connection'}',
      );
    } catch (e) {
      throw Exception('Failed to load country details: ${e.toString()}');
    }
  }
}
