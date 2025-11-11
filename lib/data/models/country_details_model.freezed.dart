// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryDetailsModel _$CountryDetailsModelFromJson(Map<String, dynamic> json) {
  return _CountryDetailsModel.fromJson(json);
}

/// @nodoc
mixin _$CountryDetailsModel {
  NameModel get name => throw _privateConstructorUsedError;
  FlagsModel get flags => throw _privateConstructorUsedError;
  int get population => throw _privateConstructorUsedError;
  List<String>? get capital => throw _privateConstructorUsedError;
  String? get region => throw _privateConstructorUsedError;
  String? get subregion => throw _privateConstructorUsedError;
  double? get area => throw _privateConstructorUsedError;
  List<String>? get timezones => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryDetailsModelCopyWith<CountryDetailsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryDetailsModelCopyWith<$Res> {
  factory $CountryDetailsModelCopyWith(
          CountryDetailsModel value, $Res Function(CountryDetailsModel) then) =
      _$CountryDetailsModelCopyWithImpl<$Res, CountryDetailsModel>;
  @useResult
  $Res call(
      {NameModel name,
      FlagsModel flags,
      int population,
      List<String>? capital,
      String? region,
      String? subregion,
      double? area,
      List<String>? timezones});

  $NameModelCopyWith<$Res> get name;
  $FlagsModelCopyWith<$Res> get flags;
}

/// @nodoc
class _$CountryDetailsModelCopyWithImpl<$Res, $Val extends CountryDetailsModel>
    implements $CountryDetailsModelCopyWith<$Res> {
  _$CountryDetailsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? flags = null,
    Object? population = null,
    Object? capital = freezed,
    Object? region = freezed,
    Object? subregion = freezed,
    Object? area = freezed,
    Object? timezones = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as NameModel,
      flags: null == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as FlagsModel,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as int,
      capital: freezed == capital
          ? _value.capital
          : capital // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      subregion: freezed == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      timezones: freezed == timezones
          ? _value.timezones
          : timezones // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NameModelCopyWith<$Res> get name {
    return $NameModelCopyWith<$Res>(_value.name, (value) {
      return _then(_value.copyWith(name: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FlagsModelCopyWith<$Res> get flags {
    return $FlagsModelCopyWith<$Res>(_value.flags, (value) {
      return _then(_value.copyWith(flags: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CountryDetailsModelImplCopyWith<$Res>
    implements $CountryDetailsModelCopyWith<$Res> {
  factory _$$CountryDetailsModelImplCopyWith(_$CountryDetailsModelImpl value,
          $Res Function(_$CountryDetailsModelImpl) then) =
      __$$CountryDetailsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NameModel name,
      FlagsModel flags,
      int population,
      List<String>? capital,
      String? region,
      String? subregion,
      double? area,
      List<String>? timezones});

  @override
  $NameModelCopyWith<$Res> get name;
  @override
  $FlagsModelCopyWith<$Res> get flags;
}

/// @nodoc
class __$$CountryDetailsModelImplCopyWithImpl<$Res>
    extends _$CountryDetailsModelCopyWithImpl<$Res, _$CountryDetailsModelImpl>
    implements _$$CountryDetailsModelImplCopyWith<$Res> {
  __$$CountryDetailsModelImplCopyWithImpl(_$CountryDetailsModelImpl _value,
      $Res Function(_$CountryDetailsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? flags = null,
    Object? population = null,
    Object? capital = freezed,
    Object? region = freezed,
    Object? subregion = freezed,
    Object? area = freezed,
    Object? timezones = freezed,
  }) {
    return _then(_$CountryDetailsModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as NameModel,
      flags: null == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as FlagsModel,
      population: null == population
          ? _value.population
          : population // ignore: cast_nullable_to_non_nullable
              as int,
      capital: freezed == capital
          ? _value._capital
          : capital // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      region: freezed == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      subregion: freezed == subregion
          ? _value.subregion
          : subregion // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      timezones: freezed == timezones
          ? _value._timezones
          : timezones // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryDetailsModelImpl implements _CountryDetailsModel {
  const _$CountryDetailsModelImpl(
      {required this.name,
      required this.flags,
      required this.population,
      required final List<String>? capital,
      required this.region,
      required this.subregion,
      required this.area,
      required final List<String>? timezones})
      : _capital = capital,
        _timezones = timezones;

  factory _$CountryDetailsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryDetailsModelImplFromJson(json);

  @override
  final NameModel name;
  @override
  final FlagsModel flags;
  @override
  final int population;
  final List<String>? _capital;
  @override
  List<String>? get capital {
    final value = _capital;
    if (value == null) return null;
    if (_capital is EqualUnmodifiableListView) return _capital;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? region;
  @override
  final String? subregion;
  @override
  final double? area;
  final List<String>? _timezones;
  @override
  List<String>? get timezones {
    final value = _timezones;
    if (value == null) return null;
    if (_timezones is EqualUnmodifiableListView) return _timezones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CountryDetailsModel(name: $name, flags: $flags, population: $population, capital: $capital, region: $region, subregion: $subregion, area: $area, timezones: $timezones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryDetailsModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.flags, flags) || other.flags == flags) &&
            (identical(other.population, population) ||
                other.population == population) &&
            const DeepCollectionEquality().equals(other._capital, _capital) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.subregion, subregion) ||
                other.subregion == subregion) &&
            (identical(other.area, area) || other.area == area) &&
            const DeepCollectionEquality()
                .equals(other._timezones, _timezones));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      flags,
      population,
      const DeepCollectionEquality().hash(_capital),
      region,
      subregion,
      area,
      const DeepCollectionEquality().hash(_timezones));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryDetailsModelImplCopyWith<_$CountryDetailsModelImpl> get copyWith =>
      __$$CountryDetailsModelImplCopyWithImpl<_$CountryDetailsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryDetailsModelImplToJson(
      this,
    );
  }
}

abstract class _CountryDetailsModel implements CountryDetailsModel {
  const factory _CountryDetailsModel(
      {required final NameModel name,
      required final FlagsModel flags,
      required final int population,
      required final List<String>? capital,
      required final String? region,
      required final String? subregion,
      required final double? area,
      required final List<String>? timezones}) = _$CountryDetailsModelImpl;

  factory _CountryDetailsModel.fromJson(Map<String, dynamic> json) =
      _$CountryDetailsModelImpl.fromJson;

  @override
  NameModel get name;
  @override
  FlagsModel get flags;
  @override
  int get population;
  @override
  List<String>? get capital;
  @override
  String? get region;
  @override
  String? get subregion;
  @override
  double? get area;
  @override
  List<String>? get timezones;
  @override
  @JsonKey(ignore: true)
  _$$CountryDetailsModelImplCopyWith<_$CountryDetailsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
