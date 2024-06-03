// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileDetails _$ProfileDetailsFromJson(Map<String, dynamic> json) {
  return _ProfileDetails.fromJson(json);
}

/// @nodoc
mixin _$ProfileDetails {
  ProfileModel? get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDetailsCopyWith<ProfileDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDetailsCopyWith<$Res> {
  factory $ProfileDetailsCopyWith(
          ProfileDetails value, $Res Function(ProfileDetails) then) =
      _$ProfileDetailsCopyWithImpl<$Res, ProfileDetails>;
  @useResult
  $Res call({ProfileModel? data, String? message, bool success});

  $ProfileModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$ProfileDetailsCopyWithImpl<$Res, $Val extends ProfileDetails>
    implements $ProfileDetailsCopyWith<$Res> {
  _$ProfileDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileDetailsImplCopyWith<$Res>
    implements $ProfileDetailsCopyWith<$Res> {
  factory _$$ProfileDetailsImplCopyWith(_$ProfileDetailsImpl value,
          $Res Function(_$ProfileDetailsImpl) then) =
      __$$ProfileDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProfileModel? data, String? message, bool success});

  @override
  $ProfileModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ProfileDetailsImplCopyWithImpl<$Res>
    extends _$ProfileDetailsCopyWithImpl<$Res, _$ProfileDetailsImpl>
    implements _$$ProfileDetailsImplCopyWith<$Res> {
  __$$ProfileDetailsImplCopyWithImpl(
      _$ProfileDetailsImpl _value, $Res Function(_$ProfileDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = freezed,
    Object? success = null,
  }) {
    return _then(_$ProfileDetailsImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileDetailsImpl implements _ProfileDetails {
  const _$ProfileDetailsImpl({this.data, this.message, this.success = false});

  factory _$ProfileDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDetailsImplFromJson(json);

  @override
  final ProfileModel? data;
  @override
  final String? message;
  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'ProfileDetails(data: $data, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDetailsImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDetailsImplCopyWith<_$ProfileDetailsImpl> get copyWith =>
      __$$ProfileDetailsImplCopyWithImpl<_$ProfileDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDetailsImplToJson(
      this,
    );
  }
}

abstract class _ProfileDetails implements ProfileDetails {
  const factory _ProfileDetails(
      {final ProfileModel? data,
      final String? message,
      final bool success}) = _$ProfileDetailsImpl;

  factory _ProfileDetails.fromJson(Map<String, dynamic> json) =
      _$ProfileDetailsImpl.fromJson;

  @override
  ProfileModel? get data;
  @override
  String? get message;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDetailsImplCopyWith<_$ProfileDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
