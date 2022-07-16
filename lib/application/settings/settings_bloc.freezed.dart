// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsEvent {
  bool get switchBool => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool switchBool) changeSwitch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool switchBool)? changeSwitch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool switchBool)? changeSwitch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeSwitch value) changeSwitch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeSwitch value)? changeSwitch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeSwitch value)? changeSwitch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsEventCopyWith<SettingsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
  $Res call({bool switchBool});
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;

  @override
  $Res call({
    Object? switchBool = freezed,
  }) {
    return _then(_value.copyWith(
      switchBool: switchBool == freezed
          ? _value.switchBool
          : switchBool // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$ChangeSwitchCopyWith<$Res>
    implements $SettingsEventCopyWith<$Res> {
  factory _$$ChangeSwitchCopyWith(
          _$ChangeSwitch value, $Res Function(_$ChangeSwitch) then) =
      __$$ChangeSwitchCopyWithImpl<$Res>;
  @override
  $Res call({bool switchBool});
}

/// @nodoc
class __$$ChangeSwitchCopyWithImpl<$Res>
    extends _$SettingsEventCopyWithImpl<$Res>
    implements _$$ChangeSwitchCopyWith<$Res> {
  __$$ChangeSwitchCopyWithImpl(
      _$ChangeSwitch _value, $Res Function(_$ChangeSwitch) _then)
      : super(_value, (v) => _then(v as _$ChangeSwitch));

  @override
  _$ChangeSwitch get _value => super._value as _$ChangeSwitch;

  @override
  $Res call({
    Object? switchBool = freezed,
  }) {
    return _then(_$ChangeSwitch(
      switchBool: switchBool == freezed
          ? _value.switchBool
          : switchBool // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ChangeSwitch implements ChangeSwitch {
  const _$ChangeSwitch({required this.switchBool});

  @override
  final bool switchBool;

  @override
  String toString() {
    return 'SettingsEvent.changeSwitch(switchBool: $switchBool)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeSwitch &&
            const DeepCollectionEquality()
                .equals(other.switchBool, switchBool));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(switchBool));

  @JsonKey(ignore: true)
  @override
  _$$ChangeSwitchCopyWith<_$ChangeSwitch> get copyWith =>
      __$$ChangeSwitchCopyWithImpl<_$ChangeSwitch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool switchBool) changeSwitch,
  }) {
    return changeSwitch(switchBool);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool switchBool)? changeSwitch,
  }) {
    return changeSwitch?.call(switchBool);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool switchBool)? changeSwitch,
    required TResult orElse(),
  }) {
    if (changeSwitch != null) {
      return changeSwitch(switchBool);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChangeSwitch value) changeSwitch,
  }) {
    return changeSwitch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ChangeSwitch value)? changeSwitch,
  }) {
    return changeSwitch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChangeSwitch value)? changeSwitch,
    required TResult orElse(),
  }) {
    if (changeSwitch != null) {
      return changeSwitch(this);
    }
    return orElse();
  }
}

abstract class ChangeSwitch implements SettingsEvent {
  const factory ChangeSwitch({required final bool switchBool}) = _$ChangeSwitch;

  @override
  bool get switchBool;
  @override
  @JsonKey(ignore: true)
  _$$ChangeSwitchCopyWith<_$ChangeSwitch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SettingsState {
  bool get isSwitched => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call({bool isSwitched});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object? isSwitched = freezed,
  }) {
    return _then(_value.copyWith(
      isSwitched: isSwitched == freezed
          ? _value.isSwitched
          : isSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$$_SettingsStateCopyWith(
          _$_SettingsState value, $Res Function(_$_SettingsState) then) =
      __$$_SettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isSwitched});
}

/// @nodoc
class __$$_SettingsStateCopyWithImpl<$Res>
    extends _$SettingsStateCopyWithImpl<$Res>
    implements _$$_SettingsStateCopyWith<$Res> {
  __$$_SettingsStateCopyWithImpl(
      _$_SettingsState _value, $Res Function(_$_SettingsState) _then)
      : super(_value, (v) => _then(v as _$_SettingsState));

  @override
  _$_SettingsState get _value => super._value as _$_SettingsState;

  @override
  $Res call({
    Object? isSwitched = freezed,
  }) {
    return _then(_$_SettingsState(
      isSwitched: isSwitched == freezed
          ? _value.isSwitched
          : isSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SettingsState implements _SettingsState {
  const _$_SettingsState({required this.isSwitched});

  @override
  final bool isSwitched;

  @override
  String toString() {
    return 'SettingsState(isSwitched: $isSwitched)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SettingsState &&
            const DeepCollectionEquality()
                .equals(other.isSwitched, isSwitched));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isSwitched));

  @JsonKey(ignore: true)
  @override
  _$$_SettingsStateCopyWith<_$_SettingsState> get copyWith =>
      __$$_SettingsStateCopyWithImpl<_$_SettingsState>(this, _$identity);
}

abstract class _SettingsState implements SettingsState {
  const factory _SettingsState({required final bool isSwitched}) =
      _$_SettingsState;

  @override
  bool get isSwitched;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsStateCopyWith<_$_SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
