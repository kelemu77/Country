import '../datasources/local/favorites_local_datasource.dart';
import '../datasources/remote/country_remote_datasource.dart';
import '../models/country_details_model.dart';
import '../models/country_summary_model.dart';

abstract class CountryRepository {
  Future<List<CountrySummaryModel>> getAllCountries();
  Future<List<CountrySummaryModel>> searchCountries(String name);
  Future<CountryDetailsModel> getCountryDetails(String code);
  Future<List<String>> getFavoriteCountryCodes();
  Future<void> toggleFavorite(String countryCode);
  Future<bool> isFavorite(String countryCode);
}

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remoteDataSource;
  final FavoritesLocalDataSource localDataSource;

  CountryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<CountrySummaryModel>> getAllCountries() {
    return remoteDataSource.getAllCountries();
  }

  @override
  Future<List<CountrySummaryModel>> searchCountries(String name) {
    return remoteDataSource.searchCountries(name);
  }

  @override
  Future<CountryDetailsModel> getCountryDetails(String code) {
    return remoteDataSource.getCountryDetails(code);
  }

  @override
  Future<List<String>> getFavoriteCountryCodes() {
    return localDataSource.getFavoriteCountryCodes();
  }

  @override
  Future<void> toggleFavorite(String countryCode) async {
    final isFav = await localDataSource.isFavorite(countryCode);
    if (isFav) {
      await localDataSource.removeFavorite(countryCode);
    } else {
      await localDataSource.addFavorite(countryCode);
    }
  }

  @override
  Future<bool> isFavorite(String countryCode) {
    return localDataSource.isFavorite(countryCode);
  }
}

