import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_summary_model.freezed.dart';
part 'country_summary_model.g.dart';

@freezed
class CountrySummaryModel with _$CountrySummaryModel {
  const factory CountrySummaryModel({
    required NameModel name,
    required FlagsModel flags,
    required int population,
    @JsonKey(name: 'cca2') required String code,
  }) = _CountrySummaryModel;

  factory CountrySummaryModel.fromJson(Map<String, dynamic> json) =>
      _$CountrySummaryModelFromJson(json);
}

@freezed
class NameModel with _$NameModel {
  const factory NameModel({
    @JsonKey(name: 'common') required String common,
    @JsonKey(name: 'official') String? official,
  }) = _NameModel;

  factory NameModel.fromJson(Map<String, dynamic> json) =>
      _$NameModelFromJson(json);
}

@freezed
class FlagsModel with _$FlagsModel {
  const factory FlagsModel({
    @JsonKey(name: 'png') String? png,
    @JsonKey(name: 'svg') String? svg,
  }) = _FlagsModel;

  factory FlagsModel.fromJson(Map<String, dynamic> json) =>
      _$FlagsModelFromJson(json);
}

