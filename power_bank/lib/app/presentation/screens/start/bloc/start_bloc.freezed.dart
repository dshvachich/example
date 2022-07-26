// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'start_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StartEventTearOff {
  const _$StartEventTearOff();

  Init init() {
    return Init();
  }

  RepeatClicked repeatClicked() {
    return RepeatClicked();
  }
}

/// @nodoc
const $StartEvent = _$StartEventTearOff();

/// @nodoc
mixin _$StartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() repeatClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? repeatClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? repeatClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(RepeatClicked value) repeatClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(RepeatClicked value)? repeatClicked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(RepeatClicked value)? repeatClicked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartEventCopyWith<$Res> {
  factory $StartEventCopyWith(StartEvent value, $Res Function(StartEvent) then) = _$StartEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$StartEventCopyWithImpl<$Res> implements $StartEventCopyWith<$Res> {
  _$StartEventCopyWithImpl(this._value, this._then);

  final StartEvent _value;
  // ignore: unused_field
  final $Res Function(StartEvent) _then;
}

/// @nodoc
abstract class $InitCopyWith<$Res> {
  factory $InitCopyWith(Init value, $Res Function(Init) then) = _$InitCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitCopyWithImpl<$Res> extends _$StartEventCopyWithImpl<$Res> implements $InitCopyWith<$Res> {
  _$InitCopyWithImpl(Init _value, $Res Function(Init) _then) : super(_value, (v) => _then(v as Init));

  @override
  Init get _value => super._value as Init;
}

/// @nodoc

class _$Init implements Init {
  _$Init();

  @override
  String toString() {
    return 'StartEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() repeatClicked,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? repeatClicked,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? repeatClicked,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(RepeatClicked value) repeatClicked,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(RepeatClicked value)? repeatClicked,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(RepeatClicked value)? repeatClicked,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements StartEvent {
  factory Init() = _$Init;
}

/// @nodoc
abstract class $RepeatClickedCopyWith<$Res> {
  factory $RepeatClickedCopyWith(RepeatClicked value, $Res Function(RepeatClicked) then) =
      _$RepeatClickedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RepeatClickedCopyWithImpl<$Res> extends _$StartEventCopyWithImpl<$Res> implements $RepeatClickedCopyWith<$Res> {
  _$RepeatClickedCopyWithImpl(RepeatClicked _value, $Res Function(RepeatClicked) _then)
      : super(_value, (v) => _then(v as RepeatClicked));

  @override
  RepeatClicked get _value => super._value as RepeatClicked;
}

/// @nodoc

class _$RepeatClicked implements RepeatClicked {
  _$RepeatClicked();

  @override
  String toString() {
    return 'StartEvent.repeatClicked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is RepeatClicked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() repeatClicked,
  }) {
    return repeatClicked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? repeatClicked,
  }) {
    return repeatClicked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? repeatClicked,
    required TResult orElse(),
  }) {
    if (repeatClicked != null) {
      return repeatClicked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(RepeatClicked value) repeatClicked,
  }) {
    return repeatClicked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(RepeatClicked value)? repeatClicked,
  }) {
    return repeatClicked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(RepeatClicked value)? repeatClicked,
    required TResult orElse(),
  }) {
    if (repeatClicked != null) {
      return repeatClicked(this);
    }
    return orElse();
  }
}

abstract class RepeatClicked implements StartEvent {
  factory RepeatClicked() = _$RepeatClicked;
}

/// @nodoc
class _$StartStateTearOff {
  const _$StartStateTearOff();

  _StartState call({BlocAction? action}) {
    return _StartState(
      action: action,
    );
  }
}

/// @nodoc
const $StartState = _$StartStateTearOff();

/// @nodoc
mixin _$StartState {
  BlocAction? get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StartStateCopyWith<StartState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartStateCopyWith<$Res> {
  factory $StartStateCopyWith(StartState value, $Res Function(StartState) then) = _$StartStateCopyWithImpl<$Res>;
  $Res call({BlocAction? action});
}

/// @nodoc
class _$StartStateCopyWithImpl<$Res> implements $StartStateCopyWith<$Res> {
  _$StartStateCopyWithImpl(this._value, this._then);

  final StartState _value;
  // ignore: unused_field
  final $Res Function(StartState) _then;

  @override
  $Res call({
    Object? action = freezed,
  }) {
    return _then(_value.copyWith(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
    ));
  }
}

/// @nodoc
abstract class _$StartStateCopyWith<$Res> implements $StartStateCopyWith<$Res> {
  factory _$StartStateCopyWith(_StartState value, $Res Function(_StartState) then) = __$StartStateCopyWithImpl<$Res>;
  @override
  $Res call({BlocAction? action});
}

/// @nodoc
class __$StartStateCopyWithImpl<$Res> extends _$StartStateCopyWithImpl<$Res> implements _$StartStateCopyWith<$Res> {
  __$StartStateCopyWithImpl(_StartState _value, $Res Function(_StartState) _then)
      : super(_value, (v) => _then(v as _StartState));

  @override
  _StartState get _value => super._value as _StartState;

  @override
  $Res call({
    Object? action = freezed,
  }) {
    return _then(_StartState(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
    ));
  }
}

/// @nodoc

class _$_StartState implements _StartState {
  _$_StartState({this.action});

  @override
  final BlocAction? action;

  @override
  String toString() {
    return 'StartState(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartState &&
            const DeepCollectionEquality().equals(other.action, action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(action));

  @JsonKey(ignore: true)
  @override
  _$StartStateCopyWith<_StartState> get copyWith => __$StartStateCopyWithImpl<_StartState>(this, _$identity);
}

abstract class _StartState implements StartState {
  factory _StartState({BlocAction? action}) = _$_StartState;

  @override
  BlocAction? get action;
  @override
  @JsonKey(ignore: true)
  _$StartStateCopyWith<_StartState> get copyWith => throw _privateConstructorUsedError;
}
