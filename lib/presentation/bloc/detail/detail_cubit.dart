import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/country_repository.dart';
import 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  final CountryRepository repository;
  final String countryCode;

  DetailCubit({
    required this.repository,
    required this.countryCode,
  }) : super(const DetailState()) {
    loadCountryDetails();
    checkFavoriteStatus();
  }

  Future<void> loadCountryDetails() async {
    emit(state.copyWith(isLoading: true, clearError: true));
    try {
      final details = await repository.getCountryDetails(countryCode);
      emit(state.copyWith(
        countryDetails: details,
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

  Future<void> checkFavoriteStatus() async {
    try {
      final isFav = await repository.isFavorite(countryCode);
      emit(state.copyWith(isFavorite: isFav));
    } catch (e) {
      // Silently fail
    }
  }

  Future<void> toggleFavorite() async {
    try {
      await repository.toggleFavorite(countryCode);
      final isFav = await repository.isFavorite(countryCode);
      emit(state.copyWith(isFavorite: isFav));
    } catch (e) {
      final errorMessage = e.toString().replaceAll('Exception: ', '');
      emit(state.copyWith(error: errorMessage));
    }
  }

  Future<void> retry() async {
    await loadCountryDetails();
  }
}

