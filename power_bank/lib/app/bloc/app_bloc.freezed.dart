// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AppEventTearOff {
  const _$AppEventTearOff();

  Init init() {
    return Init();
  }

  AppLifecycleStateChanged appLifecycleStateChanged(AppLifecycleState state) {
    return AppLifecycleStateChanged(
      state,
    );
  }
}

/// @nodoc
const $AppEvent = _$AppEventTearOff();

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value) appLifecycleStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) = _$AppEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res> implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  final AppEvent _value;
  // ignore: unused_field
  final $Res Function(AppEvent) _then;
}

/// @nodoc
abstract class $InitCopyWith<$Res> {
  factory $InitCopyWith(Init value, $Res Function(Init) then) = _$InitCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res> implements $InitCopyWith<$Res> {
  _$InitCopyWithImpl(Init _value, $Res Function(Init) _then) : super(_value, (v) => _then(v as Init));

  @override
  Init get _value => super._value as Init;
}

/// @nodoc

class _$Init implements Init {
  _$Init();

  @override
  String toString() {
    return 'AppEvent.init()';
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
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
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
    required TResult Function(AppLifecycleStateChanged value) appLifecycleStateChanged,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements AppEvent {
  factory Init() = _$Init;
}

/// @nodoc
abstract class $AppLifecycleStateChangedCopyWith<$Res> {
  factory $AppLifecycleStateChangedCopyWith(
          AppLifecycleStateChanged value, $Res Function(AppLifecycleStateChanged) then) =
      _$AppLifecycleStateChangedCopyWithImpl<$Res>;
  $Res call({AppLifecycleState state});
}

/// @nodoc
class _$AppLifecycleStateChangedCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements $AppLifecycleStateChangedCopyWith<$Res> {
  _$AppLifecycleStateChangedCopyWithImpl(AppLifecycleStateChanged _value, $Res Function(AppLifecycleStateChanged) _then)
      : super(_value, (v) => _then(v as AppLifecycleStateChanged));

  @override
  AppLifecycleStateChanged get _value => super._value as AppLifecycleStateChanged;

  @override
  $Res call({
    Object? state = freezed,
  }) {
    return _then(AppLifecycleStateChanged(
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as AppLifecycleState,
    ));
  }
}

/// @nodoc

class _$AppLifecycleStateChanged implements AppLifecycleStateChanged {
  _$AppLifecycleStateChanged(this.state);

  @override
  final AppLifecycleState state;

  @override
  String toString() {
    return 'AppEvent.appLifecycleStateChanged(state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppLifecycleStateChanged &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  $AppLifecycleStateChangedCopyWith<AppLifecycleStateChanged> get copyWith =>
      _$AppLifecycleStateChangedCopyWithImpl<AppLifecycleStateChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(AppLifecycleState state) appLifecycleStateChanged,
  }) {
    return appLifecycleStateChanged(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
  }) {
    return appLifecycleStateChanged?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(AppLifecycleState state)? appLifecycleStateChanged,
    required TResult orElse(),
  }) {
    if (appLifecycleStateChanged != null) {
      return appLifecycleStateChanged(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
    required TResult Function(AppLifecycleStateChanged value) appLifecycleStateChanged,
  }) {
    return appLifecycleStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
  }) {
    return appLifecycleStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    TResult Function(AppLifecycleStateChanged value)? appLifecycleStateChanged,
    required TResult orElse(),
  }) {
    if (appLifecycleStateChanged != null) {
      return appLifecycleStateChanged(this);
    }
    return orElse();
  }
}

abstract class AppLifecycleStateChanged implements AppEvent {
  factory AppLifecycleStateChanged(AppLifecycleState state) = _$AppLifecycleStateChanged;

  AppLifecycleState get state;
  @JsonKey(ignore: true)
  $AppLifecycleStateChangedCopyWith<AppLifecycleStateChanged> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
class _$AppStateTearOff {
  const _$AppStateTearOff();

  _AppState call({BlocAction? action, Locale? locale}) {
    return _AppState(
      action: action,
      locale: locale,
    );
  }
}

/// @nodoc
const $AppState = _$AppStateTearOff();

/// @nodoc
mixin _$AppState {
  BlocAction? get action => throw _privateConstructorUsedError;
  Locale? get locale => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) = _$AppStateCopyWithImpl<$Res>;
  $Res call({BlocAction? action, Locale? locale});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? action = freezed,
    Object? locale = freezed,
  }) {
    return _then(_value.copyWith(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }
}

/// @nodoc
abstract class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) then) = __$AppStateCopyWithImpl<$Res>;
  @override
  $Res call({BlocAction? action, Locale? locale});
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res> implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(_AppState _value, $Res Function(_AppState) _then)
      : super(_value, (v) => _then(v as _AppState));

  @override
  _AppState get _value => super._value as _AppState;

  @override
  $Res call({
    Object? action = freezed,
    Object? locale = freezed,
  }) {
    return _then(_AppState(
      action: action == freezed
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as BlocAction?,
      locale: locale == freezed
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale?,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  _$_AppState({this.action, this.locale});

  @override
  final BlocAction? action;
  @override
  final Locale? locale;

  @override
  String toString() {
    return 'AppState(action: $action, locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppState &&
            const DeepCollectionEquality().equals(other.action, action) &&
            const DeepCollectionEquality().equals(other.locale, locale));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(action), const DeepCollectionEquality().hash(locale));

  @JsonKey(ignore: true)
  @override
  _$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  factory _AppState({BlocAction? action, Locale? locale}) = _$_AppState;

  @override
  BlocAction? get action;
  @override
  Locale? get locale;
  @override
  @JsonKey(ignore: true)
  _$AppStateCopyWith<_AppState> get copyWith => throw _privateConstructorUsedError;
}
