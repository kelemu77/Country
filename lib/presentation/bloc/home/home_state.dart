import 'package:equatable/equatable.dart';
import '../../../data/models/country_summary_model.dart';

class HomeState extends Equatable {
  final List<CountrySummaryModel> allCountries;
  final List<CountrySummaryModel> filteredCountries;
  final Set<String> favoriteCodes;
  final String searchQuery;
  final bool isLoading;
  final String? error;

  const HomeState({
    this.allCountries = const [],
    this.filteredCountries = const [],
    this.favoriteCodes = const {},
    this.searchQuery = '',
    this.isLoading = false,
    this.error,
  });

  List<CountrySummaryModel> get countries => filteredCountries;
  bool isFavorite(String code) => favoriteCodes.contains(code);

  HomeState copyWith({
    List<CountrySummaryModel>? allCountries,
    List<CountrySummaryModel>? filteredCountries,
    Set<String>? favoriteCodes,
    String? searchQuery,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return HomeState(
      allCountries: allCountries ?? this.allCountries,
      filteredCountries: filteredCountries ?? this.filteredCountries,
      favoriteCodes: favoriteCodes ?? this.favoriteCodes,
      searchQuery: searchQuery ?? this.searchQuery,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [
        allCountries,
        filteredCountries,
        favoriteCodes,
        searchQuery,
        isLoading,
        error,
      ];
}

