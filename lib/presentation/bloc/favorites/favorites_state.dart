import 'package:equatable/equatable.dart';
import '../../../data/models/country_summary_model.dart';

class FavoritesState extends Equatable {
  final List<CountrySummaryModel> favoriteCountries;
  final Map<String, String> capitals;
  final bool isLoading;
  final String? error;

  const FavoritesState({
    this.favoriteCountries = const [],
    this.capitals = const {},
    this.isLoading = false,
    this.error,
  });

  FavoritesState copyWith({
    List<CountrySummaryModel>? favoriteCountries,
    Map<String, String>? capitals,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) {
    return FavoritesState(
      favoriteCountries: favoriteCountries ?? this.favoriteCountries,
      capitals: capitals ?? this.capitals,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
    );
  }

  @override
  List<Object?> get props => [favoriteCountries, capitals, isLoading, error];
}

