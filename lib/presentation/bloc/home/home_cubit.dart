import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import '../../../data/repositories/country_repository.dart';
import '../../../data/models/country_summary_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final CountryRepository repository;
  Timer? _debounceTimer;

  HomeCubit(this.repository) : super(const HomeState()) {
    loadCountries();
    loadFavorites();
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }

  Future<void> loadCountries() async {
    emit(state.copyWith(isLoading: true, clearError: true));
    try {
      final countries = await repository.getAllCountries();
      if (countries.isEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
            error: 'No countries found. Please try again.',
          ),
        );
      } else {
        final sortedCountries = _applySorting(countries, state.sortOption);
        emit(
          state.copyWith(
            allCountries: countries,
            filteredCountries: sortedCountries,
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      final errorMessage = e.toString().replaceAll('Exception: ', '');
      emit(
        state.copyWith(
          isLoading: false,
          error: errorMessage.isEmpty
              ? 'Failed to load countries. Please check your internet connection.'
              : errorMessage,
        ),
      );
    }
  }

  Future<void> loadFavorites() async {
    try {
      final favorites = await repository.getFavoriteCountryCodes();
      emit(state.copyWith(favoriteCodes: Set<String>.from(favorites)));
    } catch (e) {
      // Silently fail for favorites loading
    }
  }

  void onSearchChanged(String query) {
    emit(state.copyWith(searchQuery: query));

    _debounceTimer?.cancel();

    // If query is empty, immediately show all countries (no debounce needed)
    if (query.isEmpty) {
      final sortedCountries = _applySorting(state.allCountries, state.sortOption);
      emit(
        state.copyWith(
          filteredCountries: sortedCountries,
          clearError: true,
          isLoading: false,
        ),
      );
      return;
    }

    // Debounce search for non-empty queries
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      _performSearch(query);
    });
  }

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) {
      final sortedCountries = _applySorting(state.allCountries, state.sortOption);
      emit(
        state.copyWith(
          filteredCountries: sortedCountries,
          clearError: true,
          isLoading: false,
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true, clearError: true));
    try {
      final results = await repository.searchCountries(query);
      final sortedResults = _applySorting(results, state.sortOption);
      emit(state.copyWith(filteredCountries: sortedResults, isLoading: false));
    } catch (e) {
      final errorMessage = e.toString().replaceAll('Exception: ', '');
      emit(state.copyWith(isLoading: false, error: errorMessage));
    }
  }

  void setSortOption(SortOption sortOption) {
    final countriesToSort = state.searchQuery.isEmpty
        ? state.allCountries
        : state.filteredCountries;
    final sortedCountries = _applySorting(countriesToSort, sortOption);
    emit(state.copyWith(
      sortOption: sortOption,
      filteredCountries: sortedCountries,
    ));
  }

  List<CountrySummaryModel> _applySorting(
    List<CountrySummaryModel> countries,
    SortOption sortOption,
  ) {
    final sorted = List<CountrySummaryModel>.from(countries);
    switch (sortOption) {
      case SortOption.nameAsc:
        sorted.sort((a, b) => a.name.common.compareTo(b.name.common));
        break;
      case SortOption.nameDesc:
        sorted.sort((a, b) => b.name.common.compareTo(a.name.common));
        break;
      case SortOption.populationAsc:
        sorted.sort((a, b) => a.population.compareTo(b.population));
        break;
      case SortOption.populationDesc:
        sorted.sort((a, b) => b.population.compareTo(a.population));
        break;
      case SortOption.none:
        // No sorting
        break;
    }
    return sorted;
  }

  Future<void> toggleFavorite(String code) async {
    try {
      await repository.toggleFavorite(code);
      await loadFavorites();
    } catch (e) {
      final errorMessage = e.toString().replaceAll('Exception: ', '');
      emit(state.copyWith(error: errorMessage));
    }
  }

  Future<void> refresh() async {
    await loadCountries();
    await loadFavorites();
  }
}
