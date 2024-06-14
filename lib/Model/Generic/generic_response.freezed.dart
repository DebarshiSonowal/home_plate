// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenericResponse _$GenericResponseFromJson(Map<String, dynamic> json) {
  return _GenericResponse.fromJson(json);
}

/// @nodoc
mixin _$GenericResponse {
  String? get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericResponseCopyWith<GenericResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericResponseCopyWith<$Res> {
  factory $GenericResponseCopyWith(
          GenericResponse value, $Res Function(GenericResponse) then) =
      _$GenericResponseCopyWithImpl<$Res, GenericResponse>;
  @useResult
  $Res call({String? message, bool success});
}

/// @nodoc
class _$GenericResponseCopyWithImpl<$Res, $Val extends GenericResponse>
    implements $GenericResponseCopyWith<$Res> {
  _$GenericResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
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
}

/// @nodoc
abstract class _$$GenericResponseImplCopyWith<$Res>
    implements $GenericResponseCopyWith<$Res> {
  factory _$$GenericResponseImplCopyWith(_$GenericResponseImpl value,
          $Res Function(_$GenericResponseImpl) then) =
      __$$GenericResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, bool success});
}

/// @nodoc
class __$$GenericResponseImplCopyWithImpl<$Res>
    extends _$GenericResponseCopyWithImpl<$Res, _$GenericResponseImpl>
    implements _$$GenericResponseImplCopyWith<$Res> {
  __$$GenericResponseImplCopyWithImpl(
      _$GenericResponseImpl _value, $Res Function(_$GenericResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? success = null,
  }) {
    return _then(_$GenericResponseImpl(
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
class _$GenericResponseImpl
    with DiagnosticableTreeMixin
    implements _GenericResponse {
  const _$GenericResponseImpl({this.message, this.success = false});

  factory _$GenericResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenericResponseImplFromJson(json);

  @override
  final String? message;
  @override
  @JsonKey()
  final bool success;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenericResponse(message: $message, success: $success)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenericResponse'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('success', success));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericResponseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericResponseImplCopyWith<_$GenericResponseImpl> get copyWith =>
      __$$GenericResponseImplCopyWithImpl<_$GenericResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericResponseImplToJson(
      this,
    );
  }
}

abstract class _GenericResponse implements GenericResponse {
  const factory _GenericResponse({final String? message, final bool success}) =
      _$GenericResponseImpl;

  factory _GenericResponse.fromJson(Map<String, dynamic> json) =
      _$GenericResponseImpl.fromJson;

  @override
  String? get message;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$GenericResponseImplCopyWith<_$GenericResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GenericResponse2 _$GenericResponse2FromJson(Map<String, dynamic> json) {
  return _GenericResponse2.fromJson(json);
}

/// @nodoc
mixin _$GenericResponse2 {
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericResponse2CopyWith<GenericResponse2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericResponse2CopyWith<$Res> {
  factory $GenericResponse2CopyWith(
          GenericResponse2 value, $Res Function(GenericResponse2) then) =
      _$GenericResponse2CopyWithImpl<$Res, GenericResponse2>;
  @useResult
  $Res call({String? message, int? code, bool status});
}

/// @nodoc
class _$GenericResponse2CopyWithImpl<$Res, $Val extends GenericResponse2>
    implements $GenericResponse2CopyWith<$Res> {
  _$GenericResponse2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenericResponse2ImplCopyWith<$Res>
    implements $GenericResponse2CopyWith<$Res> {
  factory _$$GenericResponse2ImplCopyWith(_$GenericResponse2Impl value,
          $Res Function(_$GenericResponse2Impl) then) =
      __$$GenericResponse2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? code, bool status});
}

/// @nodoc
class __$$GenericResponse2ImplCopyWithImpl<$Res>
    extends _$GenericResponse2CopyWithImpl<$Res, _$GenericResponse2Impl>
    implements _$$GenericResponse2ImplCopyWith<$Res> {
  __$$GenericResponse2ImplCopyWithImpl(_$GenericResponse2Impl _value,
      $Res Function(_$GenericResponse2Impl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
    Object? status = null,
  }) {
    return _then(_$GenericResponse2Impl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenericResponse2Impl
    with DiagnosticableTreeMixin
    implements _GenericResponse2 {
  const _$GenericResponse2Impl({this.message, this.code, this.status = false});

  factory _$GenericResponse2Impl.fromJson(Map<String, dynamic> json) =>
      _$$GenericResponse2ImplFromJson(json);

  @override
  final String? message;
  @override
  final int? code;
  @override
  @JsonKey()
  final bool status;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GenericResponse2(message: $message, code: $code, status: $status)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GenericResponse2'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('status', status));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericResponse2Impl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, code, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericResponse2ImplCopyWith<_$GenericResponse2Impl> get copyWith =>
      __$$GenericResponse2ImplCopyWithImpl<_$GenericResponse2Impl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenericResponse2ImplToJson(
      this,
    );
  }
}

abstract class _GenericResponse2 implements GenericResponse2 {
  const factory _GenericResponse2(
      {final String? message,
      final int? code,
      final bool status}) = _$GenericResponse2Impl;

  factory _GenericResponse2.fromJson(Map<String, dynamic> json) =
      _$GenericResponse2Impl.fromJson;

  @override
  String? get message;
  @override
  int? get code;
  @override
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$GenericResponse2ImplCopyWith<_$GenericResponse2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
