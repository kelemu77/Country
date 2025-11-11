import 'package:equatable/equatable.dart';
import '../../../data/models/country_details_model.dart';

class DetailState extends Equatable {
  final CountryDetailsModel? countryDetails;
  final bool isLoading;
  final String? error;
  final bool isFavorite;

  const DetailState({
    this.countryDetails,
    this.isLoading = false,
    this.error,
    this.isFavorite = false,
  });

  DetailState copyWith({
    CountryDetailsModel? countryDetails,
    bool? isLoading,
    String? error,
    bool? isFavorite,
    bool clearError = false,
  }) {
    return DetailState(
      countryDetails: countryDetails ?? this.countryDetails,
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [countryDetails, isLoading, error, isFavorite];
}

