import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import '../data/datasources/local/favorites_local_datasource.dart';
import '../data/datasources/remote/country_remote_datasource.dart';
import '../data/repositories/country_repository.dart';
import '../presentation/bloc/detail/detail_cubit.dart';
import '../presentation/bloc/favorites/favorites_cubit.dart';
import '../presentation/bloc/home/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Initialize Hive for caching
  await Hive.initFlutter();
  final cacheDir = await getTemporaryDirectory();
  final cacheStore = HiveCacheStore(cacheDir.path);
  final cacheOptions = CacheOptions(
    store: cacheStore,
    policy: CachePolicy.request,
    hitCacheOnErrorExcept: [401, 403],
    maxStale: const Duration(days: 7),
  );

  // Dio with caching and timeout
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  // Add logging interceptor to print API requests and responses
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: false, // We'll handle this manually for better formatting
      error: true,
      logPrint: (object) {
        debugPrint('[API] $object');
      },
    ),
  );

  // Custom interceptor for formatted response logging
  dio.interceptors.add(
    InterceptorsWrapper(
      onResponse: (response, handler) {
        try {
          final uri = response.requestOptions.uri.toString();
          final statusCode = response.statusCode;
          final data = response.data;

          debugPrint('\n[API] ========== RESPONSE ==========');
          debugPrint('[API] URL: $uri');
          debugPrint('[API] Status: $statusCode');

          if (data != null) {
            String formattedJson;
            try {
              // Try to format as JSON
              final encoder = JsonEncoder.withIndent('  ');
              formattedJson = encoder.convert(data);
            } catch (e) {
              // If not JSON, convert to string
              formattedJson = data.toString();
            }

            // Print in chunks to avoid truncation
            const chunkSize = 800; // Flutter's debugPrint limit
            if (formattedJson.length > chunkSize) {
              debugPrint(
                '[API] Response Body (${formattedJson.length} chars):',
              );
              for (int i = 0; i < formattedJson.length; i += chunkSize) {
                final end = (i + chunkSize < formattedJson.length)
                    ? i + chunkSize
                    : formattedJson.length;
                debugPrint('[API] ${formattedJson.substring(i, end)}');
              }
            } else {
              debugPrint('[API] Response Body:');
              debugPrint('[API] $formattedJson');
            }
          }
          debugPrint('[API] ================================\n');
        } catch (e) {
          debugPrint('[API] Error formatting response: $e');
        }
        handler.next(response);
      },
    ),
  );

  dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));

  // Data Sources
  getIt.registerLazySingleton<CountryRemoteDataSource>(
    () => CountryRemoteDataSourceImpl(dio),
  );

  getIt.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<CountryRepository>(
    () => CountryRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );

  // BLoC Cubits
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  getIt.registerFactoryParam<DetailCubit, String, void>(
    (countryCode, _) =>
        DetailCubit(repository: getIt(), countryCode: countryCode),
  );

  getIt.registerFactory<FavoritesCubit>(() => FavoritesCubit(getIt()));
}
