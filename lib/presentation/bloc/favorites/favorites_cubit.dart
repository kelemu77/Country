import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/country_summary_model.dart';
import '../../../data/repositories/country_repository.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final CountryRepository repository;

  FavoritesCubit(this.repository) : super(const FavoritesState()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    emit(state.copyWith(isLoading: true, clearError: true));
    try {
      final favoriteCodes = await repository.getFavoriteCountryCodes();
      if (favoriteCodes.isEmpty) {
        emit(state.copyWith(
          favoriteCountries: [],
          capitals: {},
          isLoading: false,
        ));
        return;
      }

      // Fetch details for each favorite country
      final List<CountrySummaryModel> favorites = [];
      final Map<String, String> capitals = {};
      for (final code in favoriteCodes) {
        try {
          final details = await repository.getCountryDetails(code);
          // Convert details to summary for display
          favorites.add(
            CountrySummaryModel(
              name: details.name,
              flags: details.flags,
              population: details.population,
              code: code,
            ),
          );
          // Store capital if available
          if (details.capital != null && details.capital!.isNotEmpty) {
            capitals[code] = details.capital!.first;
          }
        } catch (e) {
          // Skip countries that fail to load
          continue;
        }
      }
      emit(state.copyWith(
        favoriteCountries: favorites,
        capitals: capitals,
        isLoading: false,
      ));
    } catch (e) {
      final errorMessage = e.toString().replaceAll('Exception: ', '');
      emit(state.copyWith(
        isLoading: false,
        error: errorMessage,
      ));
    }
  }

  Future<void> removeFavorite(String code) async {
    try {
      await repository.toggleFavorite(code);
      await loadFavorites();
    } catch (e) {
      final errorMessage = e.toString().replaceAll('Exception: ', '');
      emit(state.copyWith(error: errorMessage));
    }
  }
}

