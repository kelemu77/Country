import 'package:freezed_annotation/freezed_annotation.dart';
import 'country_summary_model.dart';

part 'country_details_model.freezed.dart';
part 'country_details_model.g.dart';

@freezed
class CountryDetailsModel with _$CountryDetailsModel {
  const factory CountryDetailsModel({
    required NameModel name,
    required FlagsModel flags,
    required int population,
    required List<String>? capital,
    required String? region,
    required String? subregion,
    required double? area,
    required List<String>? timezones,
  }) = _CountryDetailsModel;

  factory CountryDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsModelFromJson(json);
}

