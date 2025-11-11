// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountrySummaryModel _$CountrySummaryModelFromJson(Map<String, dynamic> json) {
  return _CountrySummaryModel.fromJson(json);
}

/// @nodoc
mixin _$CountrySummaryModel {
  NameModel get name => throw _privateConstructorUsedError;
  FlagsModel get flags => throw _privateConstructorUsedError;
  int get population => throw _privateConstructorUsedError;
  @JsonKey(name: 'cca2')
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountrySummaryModelCopyWith<CountrySummaryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountrySummaryModelCopyWith<$Res> {
  factory $CountrySummaryModelCopyWith(
          CountrySummaryModel value, $Res Function(CountrySummaryModel) then) =
      _$CountrySummaryModelCopyWithImpl<$Res, CountrySummaryModel>;
  @useResult
  $Res call(
      {NameModel name,
      FlagsModel flags,
      int population,
      @JsonKey(name: 'cca2') String code});

  $NameModelCopyWith<$Res> get name;
  $FlagsModelCopyWith<$Res> get flags;
}

/// @nodoc
class _$CountrySummaryModelCopyWithImpl<$Res, $Val extends CountrySummaryModel>
    implements $CountrySummaryModelCopyWith<$Res> {
  _$CountrySummaryModelCopyWithImpl(this._value, this._then);

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
    Object? code = null,
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$CountrySummaryModelImplCopyWith<$Res>
    implements $CountrySummaryModelCopyWith<$Res> {
  factory _$$CountrySummaryModelImplCopyWith(_$CountrySummaryModelImpl value,
          $Res Function(_$CountrySummaryModelImpl) then) =
      __$$CountrySummaryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NameModel name,
      FlagsModel flags,
      int population,
      @JsonKey(name: 'cca2') String code});

  @override
  $NameModelCopyWith<$Res> get name;
  @override
  $FlagsModelCopyWith<$Res> get flags;
}

/// @nodoc
class __$$CountrySummaryModelImplCopyWithImpl<$Res>
    extends _$CountrySummaryModelCopyWithImpl<$Res, _$CountrySummaryModelImpl>
    implements _$$CountrySummaryModelImplCopyWith<$Res> {
  __$$CountrySummaryModelImplCopyWithImpl(_$CountrySummaryModelImpl _value,
      $Res Function(_$CountrySummaryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? flags = null,
    Object? population = null,
    Object? code = null,
  }) {
    return _then(_$CountrySummaryModelImpl(
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
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountrySummaryModelImpl implements _CountrySummaryModel {
  const _$CountrySummaryModelImpl(
      {required this.name,
      required this.flags,
      required this.population,
      @JsonKey(name: 'cca2') required this.code});

  factory _$CountrySummaryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountrySummaryModelImplFromJson(json);

  @override
  final NameModel name;
  @override
  final FlagsModel flags;
  @override
  final int population;
  @override
  @JsonKey(name: 'cca2')
  final String code;

  @override
  String toString() {
    return 'CountrySummaryModel(name: $name, flags: $flags, population: $population, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountrySummaryModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.flags, flags) || other.flags == flags) &&
            (identical(other.population, population) ||
                other.population == population) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, flags, population, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CountrySummaryModelImplCopyWith<_$CountrySummaryModelImpl> get copyWith =>
      __$$CountrySummaryModelImplCopyWithImpl<_$CountrySummaryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountrySummaryModelImplToJson(
      this,
    );
  }
}

abstract class _CountrySummaryModel implements CountrySummaryModel {
  const factory _CountrySummaryModel(
          {required final NameModel name,
          required final FlagsModel flags,
          required final int population,
          @JsonKey(name: 'cca2') required final String code}) =
      _$CountrySummaryModelImpl;

  factory _CountrySummaryModel.fromJson(Map<String, dynamic> json) =
      _$CountrySummaryModelImpl.fromJson;

  @override
  NameModel get name;
  @override
  FlagsModel get flags;
  @override
  int get population;
  @override
  @JsonKey(name: 'cca2')
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$CountrySummaryModelImplCopyWith<_$CountrySummaryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NameModel _$NameModelFromJson(Map<String, dynamic> json) {
  return _NameModel.fromJson(json);
}

/// @nodoc
mixin _$NameModel {
  @JsonKey(name: 'common')
  String get common => throw _privateConstructorUsedError;
  @JsonKey(name: 'official')
  String? get official => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameModelCopyWith<NameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameModelCopyWith<$Res> {
  factory $NameModelCopyWith(NameModel value, $Res Function(NameModel) then) =
      _$NameModelCopyWithImpl<$Res, NameModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'common') String common,
      @JsonKey(name: 'official') String? official});
}

/// @nodoc
class _$NameModelCopyWithImpl<$Res, $Val extends NameModel>
    implements $NameModelCopyWith<$Res> {
  _$NameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? common = null,
    Object? official = freezed,
  }) {
    return _then(_value.copyWith(
      common: null == common
          ? _value.common
          : common // ignore: cast_nullable_to_non_nullable
              as String,
      official: freezed == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NameModelImplCopyWith<$Res>
    implements $NameModelCopyWith<$Res> {
  factory _$$NameModelImplCopyWith(
          _$NameModelImpl value, $Res Function(_$NameModelImpl) then) =
      __$$NameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'common') String common,
      @JsonKey(name: 'official') String? official});
}

/// @nodoc
class __$$NameModelImplCopyWithImpl<$Res>
    extends _$NameModelCopyWithImpl<$Res, _$NameModelImpl>
    implements _$$NameModelImplCopyWith<$Res> {
  __$$NameModelImplCopyWithImpl(
      _$NameModelImpl _value, $Res Function(_$NameModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? common = null,
    Object? official = freezed,
  }) {
    return _then(_$NameModelImpl(
      common: null == common
          ? _value.common
          : common // ignore: cast_nullable_to_non_nullable
              as String,
      official: freezed == official
          ? _value.official
          : official // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NameModelImpl implements _NameModel {
  const _$NameModelImpl(
      {@JsonKey(name: 'common') required this.common,
      @JsonKey(name: 'official') this.official});

  factory _$NameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NameModelImplFromJson(json);

  @override
  @JsonKey(name: 'common')
  final String common;
  @override
  @JsonKey(name: 'official')
  final String? official;

  @override
  String toString() {
    return 'NameModel(common: $common, official: $official)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameModelImpl &&
            (identical(other.common, common) || other.common == common) &&
            (identical(other.official, official) ||
                other.official == official));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, common, official);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NameModelImplCopyWith<_$NameModelImpl> get copyWith =>
      __$$NameModelImplCopyWithImpl<_$NameModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NameModelImplToJson(
      this,
    );
  }
}

abstract class _NameModel implements NameModel {
  const factory _NameModel(
      {@JsonKey(name: 'common') required final String common,
      @JsonKey(name: 'official') final String? official}) = _$NameModelImpl;

  factory _NameModel.fromJson(Map<String, dynamic> json) =
      _$NameModelImpl.fromJson;

  @override
  @JsonKey(name: 'common')
  String get common;
  @override
  @JsonKey(name: 'official')
  String? get official;
  @override
  @JsonKey(ignore: true)
  _$$NameModelImplCopyWith<_$NameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FlagsModel _$FlagsModelFromJson(Map<String, dynamic> json) {
  return _FlagsModel.fromJson(json);
}

/// @nodoc
mixin _$FlagsModel {
  @JsonKey(name: 'png')
  String? get png => throw _privateConstructorUsedError;
  @JsonKey(name: 'svg')
  String? get svg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlagsModelCopyWith<FlagsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlagsModelCopyWith<$Res> {
  factory $FlagsModelCopyWith(
          FlagsModel value, $Res Function(FlagsModel) then) =
      _$FlagsModelCopyWithImpl<$Res, FlagsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'png') String? png, @JsonKey(name: 'svg') String? svg});
}

/// @nodoc
class _$FlagsModelCopyWithImpl<$Res, $Val extends FlagsModel>
    implements $FlagsModelCopyWith<$Res> {
  _$FlagsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? png = freezed,
    Object? svg = freezed,
  }) {
    return _then(_value.copyWith(
      png: freezed == png
          ? _value.png
          : png // ignore: cast_nullable_to_non_nullable
              as String?,
      svg: freezed == svg
          ? _value.svg
          : svg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FlagsModelImplCopyWith<$Res>
    implements $FlagsModelCopyWith<$Res> {
  factory _$$FlagsModelImplCopyWith(
          _$FlagsModelImpl value, $Res Function(_$FlagsModelImpl) then) =
      __$$FlagsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'png') String? png, @JsonKey(name: 'svg') String? svg});
}

/// @nodoc
class __$$FlagsModelImplCopyWithImpl<$Res>
    extends _$FlagsModelCopyWithImpl<$Res, _$FlagsModelImpl>
    implements _$$FlagsModelImplCopyWith<$Res> {
  __$$FlagsModelImplCopyWithImpl(
      _$FlagsModelImpl _value, $Res Function(_$FlagsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? png = freezed,
    Object? svg = freezed,
  }) {
    return _then(_$FlagsModelImpl(
      png: freezed == png
          ? _value.png
          : png // ignore: cast_nullable_to_non_nullable
              as String?,
      svg: freezed == svg
          ? _value.svg
          : svg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlagsModelImpl implements _FlagsModel {
  const _$FlagsModelImpl(
      {@JsonKey(name: 'png') this.png, @JsonKey(name: 'svg') this.svg});

  factory _$FlagsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlagsModelImplFromJson(json);

  @override
  @JsonKey(name: 'png')
  final String? png;
  @override
  @JsonKey(name: 'svg')
  final String? svg;

  @override
  String toString() {
    return 'FlagsModel(png: $png, svg: $svg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlagsModelImpl &&
            (identical(other.png, png) || other.png == png) &&
            (identical(other.svg, svg) || other.svg == svg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, png, svg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlagsModelImplCopyWith<_$FlagsModelImpl> get copyWith =>
      __$$FlagsModelImplCopyWithImpl<_$FlagsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlagsModelImplToJson(
      this,
    );
  }
}

abstract class _FlagsModel implements FlagsModel {
  const factory _FlagsModel(
      {@JsonKey(name: 'png') final String? png,
      @JsonKey(name: 'svg') final String? svg}) = _$FlagsModelImpl;

  factory _FlagsModel.fromJson(Map<String, dynamic> json) =
      _$FlagsModelImpl.fromJson;

  @override
  @JsonKey(name: 'png')
  String? get png;
  @override
  @JsonKey(name: 'svg')
  String? get svg;
  @override
  @JsonKey(ignore: true)
  _$$FlagsModelImplCopyWith<_$FlagsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
