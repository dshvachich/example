// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authorization_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthorizationEventTearOff {
  const _$AuthorizationEventTearOff();

  PhoneChanged phoneChanged(PhoneNumber phone) {
    return PhoneChanged(
      phone,
    );
  }

  SendCodeClicked sendCodeClicked() {
    return SendCodeClicked();
  }

  BackClicked backClicked() {
    return BackClicked();
  }

  PrivacyPolicyClicked privacyPolicyClicked() {
    return PrivacyPolicyClicked();
  }

  StartNumberEntering startNumberEntering() {
    return StartNumberEntering();
  }

  EndNumberEntering endNumberEntering() {
    return EndNumberEntering();
  }

  TermsOfUseClicked termsOfUseClicked() {
    return TermsOfUseClicked();
  }
}

/// @nodoc
const $AuthorizationEvent = _$AuthorizationEventTearOff();

/// @nodoc
mixin _$AuthorizationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phone) phoneChanged,
    required TResult Function() sendCodeClicked,
    required TResult Function() backClicked,
    required TResult Function() privacyPolicyClicked,
    required TResult Function() startNumberEntering,
    required TResult Function() endNumberEntering,
    required TResult Function() termsOfUseClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(SendCodeClicked value) sendCodeClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(PrivacyPolicyClicked value) privacyPolicyClicked,
    required TResult Function(StartNumberEntering value) startNumberEntering,
    required TResult Function(EndNumberEntering value) endNumberEntering,
    required TResult Function(TermsOfUseClicked value) termsOfUseClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizationEventCopyWith<$Res> {
  factory $AuthorizationEventCopyWith(AuthorizationEvent value, $Res Function(AuthorizationEvent) then) =
      _$AuthorizationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthorizationEventCopyWithImpl<$Res> implements $AuthorizationEventCopyWith<$Res> {
  _$AuthorizationEventCopyWithImpl(this._value, this._then);

  final AuthorizationEvent _value;
  // ignore: unused_field
  final $Res Function(AuthorizationEvent) _then;
}

/// @nodoc
abstract class $PhoneChangedCopyWith<$Res> {
  factory $PhoneChangedCopyWith(PhoneChanged value, $Res Function(PhoneChanged) then) =
      _$PhoneChangedCopyWithImpl<$Res>;
  $Res call({PhoneNumber phone});
}

/// @nodoc
class _$PhoneChangedCopyWithImpl<$Res> extends _$AuthorizationEventCopyWithImpl<$Res>
    implements $PhoneChangedCopyWith<$Res> {
  _$PhoneChangedCopyWithImpl(PhoneChanged _value, $Res Function(PhoneChanged) _then)
      : super(_value, (v) => _then(v as PhoneChanged));

  @override
  PhoneChanged get _value => super._value as PhoneChanged;

  @override
  $Res call({
    Object? phone = freezed,
  }) {
    return _then(PhoneChanged(
      phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
    ));
  }
}

/// @nodoc

class _$PhoneChanged implements PhoneChanged {
  _$PhoneChanged(this.phone);

  @override
  final PhoneNumber phone;

  @override
  String toString() {
    return 'AuthorizationEvent.phoneChanged(phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PhoneChanged &&
            const DeepCollectionEquality().equals(other.phone, phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(phone));

  @JsonKey(ignore: true)
  @override
  $PhoneChangedCopyWith<PhoneChanged> get copyWith => _$PhoneChangedCopyWithImpl<PhoneChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phone) phoneChanged,
    required TResult Function() sendCodeClicked,
    required TResult Function() backClicked,
    required TResult Function() privacyPolicyClicked,
    required TResult Function() startNumberEntering,
    required TResult Function() endNumberEntering,
    required TResult Function() termsOfUseClicked,
  }) {
    return phoneChanged(phone);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
  }) {
    return phoneChanged?.call(phone);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(phone);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(SendCodeClicked value) sendCodeClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(PrivacyPolicyClicked value) privacyPolicyClicked,
    required TResult Function(StartNumberEntering value) startNumberEntering,
    required TResult Function(EndNumberEntering value) endNumberEntering,
    required TResult Function(TermsOfUseClicked value) termsOfUseClicked,
  }) {
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
  }) {
    return phoneChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneChanged implements AuthorizationEvent {
  factory PhoneChanged(PhoneNumber phone) = _$PhoneChanged;

  PhoneNumber get phone;
  @JsonKey(ignore: true)
  $PhoneChangedCopyWith<PhoneChanged> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendCodeClickedCopyWith<$Res> {
  factory $SendCodeClickedCopyWith(SendCodeClicked value, $Res Function(SendCodeClicked) then) =
      _$SendCodeClickedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SendCodeClickedCopyWithImpl<$Res> extends _$AuthorizationEventCopyWithImpl<$Res>
    implements $SendCodeClickedCopyWith<$Res> {
  _$SendCodeClickedCopyWithImpl(SendCodeClicked _value, $Res Function(SendCodeClicked) _then)
      : super(_value, (v) => _then(v as SendCodeClicked));

  @override
  SendCodeClicked get _value => super._value as SendCodeClicked;
}

/// @nodoc

class _$SendCodeClicked implements SendCodeClicked {
  _$SendCodeClicked();

  @override
  String toString() {
    return 'AuthorizationEvent.sendCodeClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is SendCodeClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phone) phoneChanged,
    required TResult Function() sendCodeClicked,
    required TResult Function() backClicked,
    required TResult Function() privacyPolicyClicked,
    required TResult Function() startNumberEntering,
    required TResult Function() endNumberEntering,
    required TResult Function() termsOfUseClicked,
  }) {
    return sendCodeClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
  }) {
    return sendCodeClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (sendCodeClicked != null) {
      return sendCodeClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(SendCodeClicked value) sendCodeClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(PrivacyPolicyClicked value) privacyPolicyClicked,
    required TResult Function(StartNumberEntering value) startNumberEntering,
    required TResult Function(EndNumberEntering value) endNumberEntering,
    required TResult Function(TermsOfUseClicked value) termsOfUseClicked,
  }) {
    return sendCodeClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
  }) {
    return sendCodeClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (sendCodeClicked != null) {
      return sendCodeClicked(this);
    }
    return orElse();
  }
}

abstract class SendCodeClicked implements AuthorizationEvent {
  factory SendCodeClicked() = _$SendCodeClicked;
}

/// @nodoc
abstract class $BackClickedCopyWith<$Res> {
  factory $BackClickedCopyWith(BackClicked value, $Res Function(BackClicked) then) = _$BackClickedCopyWithImpl<$Res>;
}

/// @nodoc
class _$BackClickedCopyWithImpl<$Res> extends _$AuthorizationEventCopyWithImpl<$Res>
    implements $BackClickedCopyWith<$Res> {
  _$BackClickedCopyWithImpl(BackClicked _value, $Res Function(BackClicked) _then)
      : super(_value, (v) => _then(v as BackClicked));

  @override
  BackClicked get _value => super._value as BackClicked;
}

/// @nodoc

class _$BackClicked implements BackClicked {
  _$BackClicked();

  @override
  String toString() {
    return 'AuthorizationEvent.backClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is BackClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phone) phoneChanged,
    required TResult Function() sendCodeClicked,
    required TResult Function() backClicked,
    required TResult Function() privacyPolicyClicked,
    required TResult Function() startNumberEntering,
    required TResult Function() endNumberEntering,
    required TResult Function() termsOfUseClicked,
  }) {
    return backClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
  }) {
    return backClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (backClicked != null) {
      return backClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(SendCodeClicked value) sendCodeClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(PrivacyPolicyClicked value) privacyPolicyClicked,
    required TResult Function(StartNumberEntering value) startNumberEntering,
    required TResult Function(EndNumberEntering value) endNumberEntering,
    required TResult Function(TermsOfUseClicked value) termsOfUseClicked,
  }) {
    return backClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
  }) {
    return backClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (backClicked != null) {
      return backClicked(this);
    }
    return orElse();
  }
}

abstract class BackClicked implements AuthorizationEvent {
  factory BackClicked() = _$BackClicked;
}

/// @nodoc
abstract class $PrivacyPolicyClickedCopyWith<$Res> {
  factory $PrivacyPolicyClickedCopyWith(PrivacyPolicyClicked value, $Res Function(PrivacyPolicyClicked) then) =
      _$PrivacyPolicyClickedCopyWithImpl<$Res>;
}

/// @nodoc
class _$PrivacyPolicyClickedCopyWithImpl<$Res> extends _$AuthorizationEventCopyWithImpl<$Res>
    implements $PrivacyPolicyClickedCopyWith<$Res> {
  _$PrivacyPolicyClickedCopyWithImpl(PrivacyPolicyClicked _value, $Res Function(PrivacyPolicyClicked) _then)
      : super(_value, (v) => _then(v as PrivacyPolicyClicked));

  @override
  PrivacyPolicyClicked get _value => super._value as PrivacyPolicyClicked;
}

/// @nodoc

class _$PrivacyPolicyClicked implements PrivacyPolicyClicked {
  _$PrivacyPolicyClicked();

  @override
  String toString() {
    return 'AuthorizationEvent.privacyPolicyClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is PrivacyPolicyClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phone) phoneChanged,
    required TResult Function() sendCodeClicked,
    required TResult Function() backClicked,
    required TResult Function() privacyPolicyClicked,
    required TResult Function() startNumberEntering,
    required TResult Function() endNumberEntering,
    required TResult Function() termsOfUseClicked,
  }) {
    return privacyPolicyClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
  }) {
    return privacyPolicyClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (privacyPolicyClicked != null) {
      return privacyPolicyClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(SendCodeClicked value) sendCodeClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(PrivacyPolicyClicked value) privacyPolicyClicked,
    required TResult Function(StartNumberEntering value) startNumberEntering,
    required TResult Function(EndNumberEntering value) endNumberEntering,
    required TResult Function(TermsOfUseClicked value) termsOfUseClicked,
  }) {
    return privacyPolicyClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
  }) {
    return privacyPolicyClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (privacyPolicyClicked != null) {
      return privacyPolicyClicked(this);
    }
    return orElse();
  }
}

abstract class PrivacyPolicyClicked implements AuthorizationEvent {
  factory PrivacyPolicyClicked() = _$PrivacyPolicyClicked;
}

/// @nodoc
abstract class $StartNumberEnteringCopyWith<$Res> {
  factory $StartNumberEnteringCopyWith(StartNumberEntering value, $Res Function(StartNumberEntering) then) =
      _$StartNumberEnteringCopyWithImpl<$Res>;
}

/// @nodoc
class _$StartNumberEnteringCopyWithImpl<$Res> extends _$AuthorizationEventCopyWithImpl<$Res>
    implements $StartNumberEnteringCopyWith<$Res> {
  _$StartNumberEnteringCopyWithImpl(StartNumberEntering _value, $Res Function(StartNumberEntering) _then)
      : super(_value, (v) => _then(v as StartNumberEntering));

  @override
  StartNumberEntering get _value => super._value as StartNumberEntering;
}

/// @nodoc

class _$StartNumberEntering implements StartNumberEntering {
  _$StartNumberEntering();

  @override
  String toString() {
    return 'AuthorizationEvent.startNumberEntering()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is StartNumberEntering);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phone) phoneChanged,
    required TResult Function() sendCodeClicked,
    required TResult Function() backClicked,
    required TResult Function() privacyPolicyClicked,
    required TResult Function() startNumberEntering,
    required TResult Function() endNumberEntering,
    required TResult Function() termsOfUseClicked,
  }) {
    return startNumberEntering();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
  }) {
    return startNumberEntering?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (startNumberEntering != null) {
      return startNumberEntering();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(SendCodeClicked value) sendCodeClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(PrivacyPolicyClicked value) privacyPolicyClicked,
    required TResult Function(StartNumberEntering value) startNumberEntering,
    required TResult Function(EndNumberEntering value) endNumberEntering,
    required TResult Function(TermsOfUseClicked value) termsOfUseClicked,
  }) {
    return startNumberEntering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
  }) {
    return startNumberEntering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (startNumberEntering != null) {
      return startNumberEntering(this);
    }
    return orElse();
  }
}

abstract class StartNumberEntering implements AuthorizationEvent {
  factory StartNumberEntering() = _$StartNumberEntering;
}

/// @nodoc
abstract class $EndNumberEnteringCopyWith<$Res> {
  factory $EndNumberEnteringCopyWith(EndNumberEntering value, $Res Function(EndNumberEntering) then) =
      _$EndNumberEnteringCopyWithImpl<$Res>;
}

/// @nodoc
class _$EndNumberEnteringCopyWithImpl<$Res> extends _$AuthorizationEventCopyWithImpl<$Res>
    implements $EndNumberEnteringCopyWith<$Res> {
  _$EndNumberEnteringCopyWithImpl(EndNumberEntering _value, $Res Function(EndNumberEntering) _then)
      : super(_value, (v) => _then(v as EndNumberEntering));

  @override
  EndNumberEntering get _value => super._value as EndNumberEntering;
}

/// @nodoc

class _$EndNumberEntering implements EndNumberEntering {
  _$EndNumberEntering();

  @override
  String toString() {
    return 'AuthorizationEvent.endNumberEntering()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is EndNumberEntering);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phone) phoneChanged,
    required TResult Function() sendCodeClicked,
    required TResult Function() backClicked,
    required TResult Function() privacyPolicyClicked,
    required TResult Function() startNumberEntering,
    required TResult Function() endNumberEntering,
    required TResult Function() termsOfUseClicked,
  }) {
    return endNumberEntering();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
  }) {
    return endNumberEntering?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (endNumberEntering != null) {
      return endNumberEntering();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(SendCodeClicked value) sendCodeClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(PrivacyPolicyClicked value) privacyPolicyClicked,
    required TResult Function(StartNumberEntering value) startNumberEntering,
    required TResult Function(EndNumberEntering value) endNumberEntering,
    required TResult Function(TermsOfUseClicked value) termsOfUseClicked,
  }) {
    return endNumberEntering(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
  }) {
    return endNumberEntering?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (endNumberEntering != null) {
      return endNumberEntering(this);
    }
    return orElse();
  }
}

abstract class EndNumberEntering implements AuthorizationEvent {
  factory EndNumberEntering() = _$EndNumberEntering;
}

/// @nodoc
abstract class $TermsOfUseClickedCopyWith<$Res> {
  factory $TermsOfUseClickedCopyWith(TermsOfUseClicked value, $Res Function(TermsOfUseClicked) then) =
      _$TermsOfUseClickedCopyWithImpl<$Res>;
}

/// @nodoc
class _$TermsOfUseClickedCopyWithImpl<$Res> extends _$AuthorizationEventCopyWithImpl<$Res>
    implements $TermsOfUseClickedCopyWith<$Res> {
  _$TermsOfUseClickedCopyWithImpl(TermsOfUseClicked _value, $Res Function(TermsOfUseClicked) _then)
      : super(_value, (v) => _then(v as TermsOfUseClicked));

  @override
  TermsOfUseClicked get _value => super._value as TermsOfUseClicked;
}

/// @nodoc

class _$TermsOfUseClicked implements TermsOfUseClicked {
  _$TermsOfUseClicked();

  @override
  String toString() {
    return 'AuthorizationEvent.termsOfUseClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is TermsOfUseClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PhoneNumber phone) phoneChanged,
    required TResult Function() sendCodeClicked,
    required TResult Function() backClicked,
    required TResult Function() privacyPolicyClicked,
    required TResult Function() startNumberEntering,
    required TResult Function() endNumberEntering,
    required TResult Function() termsOfUseClicked,
  }) {
    return termsOfUseClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
  }) {
    return termsOfUseClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PhoneNumber phone)? phoneChanged,
    TResult Function()? sendCodeClicked,
    TResult Function()? backClicked,
    TResult Function()? privacyPolicyClicked,
    TResult Function()? startNumberEntering,
    TResult Function()? endNumberEntering,
    TResult Function()? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (termsOfUseClicked != null) {
      return termsOfUseClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(SendCodeClicked value) sendCodeClicked,
    required TResult Function(BackClicked value) backClicked,
    required TResult Function(PrivacyPolicyClicked value) privacyPolicyClicked,
    required TResult Function(StartNumberEntering value) startNumberEntering,
    required TResult Function(EndNumberEntering value) endNumberEntering,
    required TResult Function(TermsOfUseClicked value) termsOfUseClicked,
  }) {
    return termsOfUseClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
  }) {
    return termsOfUseClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(SendCodeClicked value)? sendCodeClicked,
    TResult Function(BackClicked value)? backClicked,
    TResult Function(PrivacyPolicyClicked value)? privacyPolicyClicked,
    TResult Function(StartNumberEntering value)? startNumberEntering,
    TResult Function(EndNumberEntering value)? endNumberEntering,
    TResult Function(TermsOfUseClicked value)? termsOfUseClicked,
    required TResult orElse(),
  }) {
    if (termsOfUseClicked != null) {
      return termsOfUseClicked(this);
    }
    return orElse();
  }
}

abstract class TermsOfUseClicked implements AuthorizationEvent {
  factory TermsOfUseClicked() = _$TermsOfUseClicked;
}

/// @nodoc
class _$AuthorizationStateTearOff {
  const _$AuthorizationStateTearOff();

  _AuthorizationState call(
      {BlocAction? action,
      PhoneForm phone = const PhoneForm.pure(),
      bool numberEntering = false,
      bool isLoading = false,
      bool buttonEnabled = false}) {
    return _AuthorizationState(
      action: action,
      phone: phone,
      numberEntering: numberEntering,
      isLoading: isLoading,
      buttonEnabled: buttonEnabled,
    );
  }
}

/// @nodoc
const $AuthorizationState = _$AuthorizationStateTearOff();

/// @nodoc
mixin _$AuthorizationState {
  BlocAction? get action => throw _privateConstructorUsedError;
  PhoneForm get phone => throw _privateConstructorUsedError;
  bool get numberEntering => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get buttonEnabled => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthorizationStateCopyWith<AuthorizationState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizationStateCopyWith<$Res> {
  factory $AuthorizationStateCopyWith(AuthorizationState value, $Res Function(AuthorizationState) then) =
      _$AuthorizationStateCopyWithImpl<$Res>;
  $Res call({BlocAction? action, PhoneForm phone, bool numberEntering, bool isLoading, bool buttonEnabled});
}

/// @nodoc
class _$AuthorizationStateCopyWithImpl<$Res> implements $AuthorizationStateCopyWith<$Res> {
  _$AuthorizationStateCopyWithImpl(this._value, this._then);

  final AuthorizationState _value;
  // ignore: unused_field
  final $Res Function(AuthorizationState) _then;

  @override
  $Res call({
    Object? action = freezed,
    Object? phone = freezed,
    Object? numberEntering = freezed,
    Object? isLoading = freezed,
    Object? buttonEnabled = freezed,
  }) {
    return _then(_value.copyWith(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneForm,
      numberEntering: numberEntering == freezed
          ? _value.numberEntering
          : numberEntering // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      buttonEnabled: buttonEnabled == freezed
          ? _value.buttonEnabled
          : buttonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AuthorizationStateCopyWith<$Res> implements $AuthorizationStateCopyWith<$Res> {
  factory _$AuthorizationStateCopyWith(_AuthorizationState value, $Res Function(_AuthorizationState) then) =
      __$AuthorizationStateCopyWithImpl<$Res>;
  @override
  $Res call({BlocAction? action, PhoneForm phone, bool numberEntering, bool isLoading, bool buttonEnabled});
}

/// @nodoc
class __$AuthorizationStateCopyWithImpl<$Res> extends _$AuthorizationStateCopyWithImpl<$Res>
    implements _$AuthorizationStateCopyWith<$Res> {
  __$AuthorizationStateCopyWithImpl(_AuthorizationState _value, $Res Function(_AuthorizationState) _then)
      : super(_value, (v) => _then(v as _AuthorizationState));

  @override
  _AuthorizationState get _value => super._value as _AuthorizationState;

  @override
  $Res call({
    Object? action = freezed,
    Object? phone = freezed,
    Object? numberEntering = freezed,
    Object? isLoading = freezed,
    Object? buttonEnabled = freezed,
  }) {
    return _then(_AuthorizationState(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as PhoneForm,
      numberEntering: numberEntering == freezed
          ? _value.numberEntering
          : numberEntering // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      buttonEnabled: buttonEnabled == freezed
          ? _value.buttonEnabled
          : buttonEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthorizationState implements _AuthorizationState {
  _$_AuthorizationState(
      {this.action,
      this.phone = const PhoneForm.pure(),
      this.numberEntering = false,
      this.isLoading = false,
      this.buttonEnabled = false});

  @override
  final BlocAction? action;
  @JsonKey()
  @override
  final PhoneForm phone;
  @JsonKey()
  @override
  final bool numberEntering;
  @JsonKey()
  @override
  final bool isLoading;
  @JsonKey()
  @override
  final bool buttonEnabled;

  @override
  String toString() {
    return 'AuthorizationState(action: $action, phone: $phone, numberEntering: $numberEntering, isLoading: $isLoading, buttonEnabled: $buttonEnabled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuthorizationState &&
            const DeepCollectionEquality().equals(other.action, action) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.numberEntering, numberEntering) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.buttonEnabled, buttonEnabled));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(action),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(numberEntering),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(buttonEnabled));

  @JsonKey(ignore: true)
  @override
  _$AuthorizationStateCopyWith<_AuthorizationState> get copyWith =>
      __$AuthorizationStateCopyWithImpl<_AuthorizationState>(this, _$identity);
}

abstract class _AuthorizationState implements AuthorizationState {
  factory _AuthorizationState(
      {BlocAction? action,
      PhoneForm phone,
      bool numberEntering,
      bool isLoading,
      bool buttonEnabled}) = _$_AuthorizationState;

  @override
  BlocAction? get action;
  @override
  PhoneForm get phone;
  @override
  bool get numberEntering;
  @override
  bool get isLoading;
  @override
  bool get buttonEnabled;
  @override
  @JsonKey(ignore: true)
  _$AuthorizationStateCopyWith<_AuthorizationState> get copyWith => throw _privateConstructorUsedError;
}
