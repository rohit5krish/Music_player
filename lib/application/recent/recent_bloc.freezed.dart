// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recent_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRecentSongs,
    required TResult Function(audioModel songData) addSongToRecent,
    required TResult Function() deleteAllRecentSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getRecentSongs,
    TResult Function(audioModel songData)? addSongToRecent,
    TResult Function()? deleteAllRecentSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRecentSongs,
    TResult Function(audioModel songData)? addSongToRecent,
    TResult Function()? deleteAllRecentSongs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRecentSongs value) getRecentSongs,
    required TResult Function(AddSongToRecent value) addSongToRecent,
    required TResult Function(DeleteAllRecentSongs value) deleteAllRecentSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetRecentSongs value)? getRecentSongs,
    TResult Function(AddSongToRecent value)? addSongToRecent,
    TResult Function(DeleteAllRecentSongs value)? deleteAllRecentSongs,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecentSongs value)? getRecentSongs,
    TResult Function(AddSongToRecent value)? addSongToRecent,
    TResult Function(DeleteAllRecentSongs value)? deleteAllRecentSongs,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentEventCopyWith<$Res> {
  factory $RecentEventCopyWith(
          RecentEvent value, $Res Function(RecentEvent) then) =
      _$RecentEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$RecentEventCopyWithImpl<$Res> implements $RecentEventCopyWith<$Res> {
  _$RecentEventCopyWithImpl(this._value, this._then);

  final RecentEvent _value;
  // ignore: unused_field
  final $Res Function(RecentEvent) _then;
}

/// @nodoc
abstract class _$$GetRecentSongsCopyWith<$Res> {
  factory _$$GetRecentSongsCopyWith(
          _$GetRecentSongs value, $Res Function(_$GetRecentSongs) then) =
      __$$GetRecentSongsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRecentSongsCopyWithImpl<$Res>
    extends _$RecentEventCopyWithImpl<$Res>
    implements _$$GetRecentSongsCopyWith<$Res> {
  __$$GetRecentSongsCopyWithImpl(
      _$GetRecentSongs _value, $Res Function(_$GetRecentSongs) _then)
      : super(_value, (v) => _then(v as _$GetRecentSongs));

  @override
  _$GetRecentSongs get _value => super._value as _$GetRecentSongs;
}

/// @nodoc

class _$GetRecentSongs implements GetRecentSongs {
  const _$GetRecentSongs();

  @override
  String toString() {
    return 'RecentEvent.getRecentSongs()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetRecentSongs);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRecentSongs,
    required TResult Function(audioModel songData) addSongToRecent,
    required TResult Function() deleteAllRecentSongs,
  }) {
    return getRecentSongs();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getRecentSongs,
    TResult Function(audioModel songData)? addSongToRecent,
    TResult Function()? deleteAllRecentSongs,
  }) {
    return getRecentSongs?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRecentSongs,
    TResult Function(audioModel songData)? addSongToRecent,
    TResult Function()? deleteAllRecentSongs,
    required TResult orElse(),
  }) {
    if (getRecentSongs != null) {
      return getRecentSongs();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRecentSongs value) getRecentSongs,
    required TResult Function(AddSongToRecent value) addSongToRecent,
    required TResult Function(DeleteAllRecentSongs value) deleteAllRecentSongs,
  }) {
    return getRecentSongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetRecentSongs value)? getRecentSongs,
    TResult Function(AddSongToRecent value)? addSongToRecent,
    TResult Function(DeleteAllRecentSongs value)? deleteAllRecentSongs,
  }) {
    return getRecentSongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecentSongs value)? getRecentSongs,
    TResult Function(AddSongToRecent value)? addSongToRecent,
    TResult Function(DeleteAllRecentSongs value)? deleteAllRecentSongs,
    required TResult orElse(),
  }) {
    if (getRecentSongs != null) {
      return getRecentSongs(this);
    }
    return orElse();
  }
}

abstract class GetRecentSongs implements RecentEvent {
  const factory GetRecentSongs() = _$GetRecentSongs;
}

/// @nodoc
abstract class _$$AddSongToRecentCopyWith<$Res> {
  factory _$$AddSongToRecentCopyWith(
          _$AddSongToRecent value, $Res Function(_$AddSongToRecent) then) =
      __$$AddSongToRecentCopyWithImpl<$Res>;
  $Res call({audioModel songData});
}

/// @nodoc
class __$$AddSongToRecentCopyWithImpl<$Res>
    extends _$RecentEventCopyWithImpl<$Res>
    implements _$$AddSongToRecentCopyWith<$Res> {
  __$$AddSongToRecentCopyWithImpl(
      _$AddSongToRecent _value, $Res Function(_$AddSongToRecent) _then)
      : super(_value, (v) => _then(v as _$AddSongToRecent));

  @override
  _$AddSongToRecent get _value => super._value as _$AddSongToRecent;

  @override
  $Res call({
    Object? songData = freezed,
  }) {
    return _then(_$AddSongToRecent(
      songData: songData == freezed
          ? _value.songData
          : songData // ignore: cast_nullable_to_non_nullable
              as audioModel,
    ));
  }
}

/// @nodoc

class _$AddSongToRecent implements AddSongToRecent {
  const _$AddSongToRecent({required this.songData});

  @override
  final audioModel songData;

  @override
  String toString() {
    return 'RecentEvent.addSongToRecent(songData: $songData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSongToRecent &&
            const DeepCollectionEquality().equals(other.songData, songData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(songData));

  @JsonKey(ignore: true)
  @override
  _$$AddSongToRecentCopyWith<_$AddSongToRecent> get copyWith =>
      __$$AddSongToRecentCopyWithImpl<_$AddSongToRecent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRecentSongs,
    required TResult Function(audioModel songData) addSongToRecent,
    required TResult Function() deleteAllRecentSongs,
  }) {
    return addSongToRecent(songData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getRecentSongs,
    TResult Function(audioModel songData)? addSongToRecent,
    TResult Function()? deleteAllRecentSongs,
  }) {
    return addSongToRecent?.call(songData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRecentSongs,
    TResult Function(audioModel songData)? addSongToRecent,
    TResult Function()? deleteAllRecentSongs,
    required TResult orElse(),
  }) {
    if (addSongToRecent != null) {
      return addSongToRecent(songData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRecentSongs value) getRecentSongs,
    required TResult Function(AddSongToRecent value) addSongToRecent,
    required TResult Function(DeleteAllRecentSongs value) deleteAllRecentSongs,
  }) {
    return addSongToRecent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetRecentSongs value)? getRecentSongs,
    TResult Function(AddSongToRecent value)? addSongToRecent,
    TResult Function(DeleteAllRecentSongs value)? deleteAllRecentSongs,
  }) {
    return addSongToRecent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecentSongs value)? getRecentSongs,
    TResult Function(AddSongToRecent value)? addSongToRecent,
    TResult Function(DeleteAllRecentSongs value)? deleteAllRecentSongs,
    required TResult orElse(),
  }) {
    if (addSongToRecent != null) {
      return addSongToRecent(this);
    }
    return orElse();
  }
}

abstract class AddSongToRecent implements RecentEvent {
  const factory AddSongToRecent({required final audioModel songData}) =
      _$AddSongToRecent;

  audioModel get songData;
  @JsonKey(ignore: true)
  _$$AddSongToRecentCopyWith<_$AddSongToRecent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAllRecentSongsCopyWith<$Res> {
  factory _$$DeleteAllRecentSongsCopyWith(_$DeleteAllRecentSongs value,
          $Res Function(_$DeleteAllRecentSongs) then) =
      __$$DeleteAllRecentSongsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteAllRecentSongsCopyWithImpl<$Res>
    extends _$RecentEventCopyWithImpl<$Res>
    implements _$$DeleteAllRecentSongsCopyWith<$Res> {
  __$$DeleteAllRecentSongsCopyWithImpl(_$DeleteAllRecentSongs _value,
      $Res Function(_$DeleteAllRecentSongs) _then)
      : super(_value, (v) => _then(v as _$DeleteAllRecentSongs));

  @override
  _$DeleteAllRecentSongs get _value => super._value as _$DeleteAllRecentSongs;
}

/// @nodoc

class _$DeleteAllRecentSongs implements DeleteAllRecentSongs {
  const _$DeleteAllRecentSongs();

  @override
  String toString() {
    return 'RecentEvent.deleteAllRecentSongs()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteAllRecentSongs);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getRecentSongs,
    required TResult Function(audioModel songData) addSongToRecent,
    required TResult Function() deleteAllRecentSongs,
  }) {
    return deleteAllRecentSongs();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getRecentSongs,
    TResult Function(audioModel songData)? addSongToRecent,
    TResult Function()? deleteAllRecentSongs,
  }) {
    return deleteAllRecentSongs?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getRecentSongs,
    TResult Function(audioModel songData)? addSongToRecent,
    TResult Function()? deleteAllRecentSongs,
    required TResult orElse(),
  }) {
    if (deleteAllRecentSongs != null) {
      return deleteAllRecentSongs();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRecentSongs value) getRecentSongs,
    required TResult Function(AddSongToRecent value) addSongToRecent,
    required TResult Function(DeleteAllRecentSongs value) deleteAllRecentSongs,
  }) {
    return deleteAllRecentSongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetRecentSongs value)? getRecentSongs,
    TResult Function(AddSongToRecent value)? addSongToRecent,
    TResult Function(DeleteAllRecentSongs value)? deleteAllRecentSongs,
  }) {
    return deleteAllRecentSongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecentSongs value)? getRecentSongs,
    TResult Function(AddSongToRecent value)? addSongToRecent,
    TResult Function(DeleteAllRecentSongs value)? deleteAllRecentSongs,
    required TResult orElse(),
  }) {
    if (deleteAllRecentSongs != null) {
      return deleteAllRecentSongs(this);
    }
    return orElse();
  }
}

abstract class DeleteAllRecentSongs implements RecentEvent {
  const factory DeleteAllRecentSongs() = _$DeleteAllRecentSongs;
}

/// @nodoc
mixin _$RecentState {
  List<Audio> get finalRecentSongs => throw _privateConstructorUsedError;
  List<audioModel> get recentSongs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecentStateCopyWith<RecentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentStateCopyWith<$Res> {
  factory $RecentStateCopyWith(
          RecentState value, $Res Function(RecentState) then) =
      _$RecentStateCopyWithImpl<$Res>;
  $Res call({List<Audio> finalRecentSongs, List<audioModel> recentSongs});
}

/// @nodoc
class _$RecentStateCopyWithImpl<$Res> implements $RecentStateCopyWith<$Res> {
  _$RecentStateCopyWithImpl(this._value, this._then);

  final RecentState _value;
  // ignore: unused_field
  final $Res Function(RecentState) _then;

  @override
  $Res call({
    Object? finalRecentSongs = freezed,
    Object? recentSongs = freezed,
  }) {
    return _then(_value.copyWith(
      finalRecentSongs: finalRecentSongs == freezed
          ? _value.finalRecentSongs
          : finalRecentSongs // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
      recentSongs: recentSongs == freezed
          ? _value.recentSongs
          : recentSongs // ignore: cast_nullable_to_non_nullable
              as List<audioModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_RecentStateCopyWith<$Res>
    implements $RecentStateCopyWith<$Res> {
  factory _$$_RecentStateCopyWith(
          _$_RecentState value, $Res Function(_$_RecentState) then) =
      __$$_RecentStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Audio> finalRecentSongs, List<audioModel> recentSongs});
}

/// @nodoc
class __$$_RecentStateCopyWithImpl<$Res> extends _$RecentStateCopyWithImpl<$Res>
    implements _$$_RecentStateCopyWith<$Res> {
  __$$_RecentStateCopyWithImpl(
      _$_RecentState _value, $Res Function(_$_RecentState) _then)
      : super(_value, (v) => _then(v as _$_RecentState));

  @override
  _$_RecentState get _value => super._value as _$_RecentState;

  @override
  $Res call({
    Object? finalRecentSongs = freezed,
    Object? recentSongs = freezed,
  }) {
    return _then(_$_RecentState(
      finalRecentSongs: finalRecentSongs == freezed
          ? _value._finalRecentSongs
          : finalRecentSongs // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
      recentSongs: recentSongs == freezed
          ? _value._recentSongs
          : recentSongs // ignore: cast_nullable_to_non_nullable
              as List<audioModel>,
    ));
  }
}

/// @nodoc

class _$_RecentState implements _RecentState {
  const _$_RecentState(
      {required final List<Audio> finalRecentSongs,
      required final List<audioModel> recentSongs})
      : _finalRecentSongs = finalRecentSongs,
        _recentSongs = recentSongs;

  final List<Audio> _finalRecentSongs;
  @override
  List<Audio> get finalRecentSongs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_finalRecentSongs);
  }

  final List<audioModel> _recentSongs;
  @override
  List<audioModel> get recentSongs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentSongs);
  }

  @override
  String toString() {
    return 'RecentState(finalRecentSongs: $finalRecentSongs, recentSongs: $recentSongs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecentState &&
            const DeepCollectionEquality()
                .equals(other._finalRecentSongs, _finalRecentSongs) &&
            const DeepCollectionEquality()
                .equals(other._recentSongs, _recentSongs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_finalRecentSongs),
      const DeepCollectionEquality().hash(_recentSongs));

  @JsonKey(ignore: true)
  @override
  _$$_RecentStateCopyWith<_$_RecentState> get copyWith =>
      __$$_RecentStateCopyWithImpl<_$_RecentState>(this, _$identity);
}

abstract class _RecentState implements RecentState {
  const factory _RecentState(
      {required final List<Audio> finalRecentSongs,
      required final List<audioModel> recentSongs}) = _$_RecentState;

  @override
  List<Audio> get finalRecentSongs;
  @override
  List<audioModel> get recentSongs;
  @override
  @JsonKey(ignore: true)
  _$$_RecentStateCopyWith<_$_RecentState> get copyWith =>
      throw _privateConstructorUsedError;
}
