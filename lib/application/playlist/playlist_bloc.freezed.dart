// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'playlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPlaylistNames,
    required TResult Function(String newPlylstName) createBlocPlaylist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getPlaylistNames,
    TResult Function(String newPlylstName)? createBlocPlaylist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPlaylistNames,
    TResult Function(String newPlylstName)? createBlocPlaylist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaylistNames value) getPlaylistNames,
    required TResult Function(CreateBlocPlaylist value) createBlocPlaylist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlaylistNames value)? getPlaylistNames,
    TResult Function(CreateBlocPlaylist value)? createBlocPlaylist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaylistNames value)? getPlaylistNames,
    TResult Function(CreateBlocPlaylist value)? createBlocPlaylist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistEventCopyWith<$Res> {
  factory $PlaylistEventCopyWith(
          PlaylistEvent value, $Res Function(PlaylistEvent) then) =
      _$PlaylistEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PlaylistEventCopyWithImpl<$Res>
    implements $PlaylistEventCopyWith<$Res> {
  _$PlaylistEventCopyWithImpl(this._value, this._then);

  final PlaylistEvent _value;
  // ignore: unused_field
  final $Res Function(PlaylistEvent) _then;
}

/// @nodoc
abstract class _$$GetPlaylistNamesCopyWith<$Res> {
  factory _$$GetPlaylistNamesCopyWith(
          _$GetPlaylistNames value, $Res Function(_$GetPlaylistNames) then) =
      __$$GetPlaylistNamesCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPlaylistNamesCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res>
    implements _$$GetPlaylistNamesCopyWith<$Res> {
  __$$GetPlaylistNamesCopyWithImpl(
      _$GetPlaylistNames _value, $Res Function(_$GetPlaylistNames) _then)
      : super(_value, (v) => _then(v as _$GetPlaylistNames));

  @override
  _$GetPlaylistNames get _value => super._value as _$GetPlaylistNames;
}

/// @nodoc

class _$GetPlaylistNames implements GetPlaylistNames {
  const _$GetPlaylistNames();

  @override
  String toString() {
    return 'PlaylistEvent.getPlaylistNames()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPlaylistNames);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPlaylistNames,
    required TResult Function(String newPlylstName) createBlocPlaylist,
  }) {
    return getPlaylistNames();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getPlaylistNames,
    TResult Function(String newPlylstName)? createBlocPlaylist,
  }) {
    return getPlaylistNames?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPlaylistNames,
    TResult Function(String newPlylstName)? createBlocPlaylist,
    required TResult orElse(),
  }) {
    if (getPlaylistNames != null) {
      return getPlaylistNames();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaylistNames value) getPlaylistNames,
    required TResult Function(CreateBlocPlaylist value) createBlocPlaylist,
  }) {
    return getPlaylistNames(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlaylistNames value)? getPlaylistNames,
    TResult Function(CreateBlocPlaylist value)? createBlocPlaylist,
  }) {
    return getPlaylistNames?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaylistNames value)? getPlaylistNames,
    TResult Function(CreateBlocPlaylist value)? createBlocPlaylist,
    required TResult orElse(),
  }) {
    if (getPlaylistNames != null) {
      return getPlaylistNames(this);
    }
    return orElse();
  }
}

abstract class GetPlaylistNames implements PlaylistEvent {
  const factory GetPlaylistNames() = _$GetPlaylistNames;
}

/// @nodoc
abstract class _$$CreateBlocPlaylistCopyWith<$Res> {
  factory _$$CreateBlocPlaylistCopyWith(_$CreateBlocPlaylist value,
          $Res Function(_$CreateBlocPlaylist) then) =
      __$$CreateBlocPlaylistCopyWithImpl<$Res>;
  $Res call({String newPlylstName});
}

/// @nodoc
class __$$CreateBlocPlaylistCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res>
    implements _$$CreateBlocPlaylistCopyWith<$Res> {
  __$$CreateBlocPlaylistCopyWithImpl(
      _$CreateBlocPlaylist _value, $Res Function(_$CreateBlocPlaylist) _then)
      : super(_value, (v) => _then(v as _$CreateBlocPlaylist));

  @override
  _$CreateBlocPlaylist get _value => super._value as _$CreateBlocPlaylist;

  @override
  $Res call({
    Object? newPlylstName = freezed,
  }) {
    return _then(_$CreateBlocPlaylist(
      newPlylstName: newPlylstName == freezed
          ? _value.newPlylstName
          : newPlylstName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateBlocPlaylist implements CreateBlocPlaylist {
  const _$CreateBlocPlaylist({required this.newPlylstName});

  @override
  final String newPlylstName;

  @override
  String toString() {
    return 'PlaylistEvent.createBlocPlaylist(newPlylstName: $newPlylstName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBlocPlaylist &&
            const DeepCollectionEquality()
                .equals(other.newPlylstName, newPlylstName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(newPlylstName));

  @JsonKey(ignore: true)
  @override
  _$$CreateBlocPlaylistCopyWith<_$CreateBlocPlaylist> get copyWith =>
      __$$CreateBlocPlaylistCopyWithImpl<_$CreateBlocPlaylist>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPlaylistNames,
    required TResult Function(String newPlylstName) createBlocPlaylist,
  }) {
    return createBlocPlaylist(newPlylstName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getPlaylistNames,
    TResult Function(String newPlylstName)? createBlocPlaylist,
  }) {
    return createBlocPlaylist?.call(newPlylstName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPlaylistNames,
    TResult Function(String newPlylstName)? createBlocPlaylist,
    required TResult orElse(),
  }) {
    if (createBlocPlaylist != null) {
      return createBlocPlaylist(newPlylstName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaylistNames value) getPlaylistNames,
    required TResult Function(CreateBlocPlaylist value) createBlocPlaylist,
  }) {
    return createBlocPlaylist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlaylistNames value)? getPlaylistNames,
    TResult Function(CreateBlocPlaylist value)? createBlocPlaylist,
  }) {
    return createBlocPlaylist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaylistNames value)? getPlaylistNames,
    TResult Function(CreateBlocPlaylist value)? createBlocPlaylist,
    required TResult orElse(),
  }) {
    if (createBlocPlaylist != null) {
      return createBlocPlaylist(this);
    }
    return orElse();
  }
}

abstract class CreateBlocPlaylist implements PlaylistEvent {
  const factory CreateBlocPlaylist({required final String newPlylstName}) =
      _$CreateBlocPlaylist;

  String get newPlylstName;
  @JsonKey(ignore: true)
  _$$CreateBlocPlaylistCopyWith<_$CreateBlocPlaylist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlaylistState {
  List<String> get playlistNames => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistStateCopyWith<PlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistStateCopyWith<$Res> {
  factory $PlaylistStateCopyWith(
          PlaylistState value, $Res Function(PlaylistState) then) =
      _$PlaylistStateCopyWithImpl<$Res>;
  $Res call({List<String> playlistNames});
}

/// @nodoc
class _$PlaylistStateCopyWithImpl<$Res>
    implements $PlaylistStateCopyWith<$Res> {
  _$PlaylistStateCopyWithImpl(this._value, this._then);

  final PlaylistState _value;
  // ignore: unused_field
  final $Res Function(PlaylistState) _then;

  @override
  $Res call({
    Object? playlistNames = freezed,
  }) {
    return _then(_value.copyWith(
      playlistNames: playlistNames == freezed
          ? _value.playlistNames
          : playlistNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
abstract class _$$_PlaylistStateCopyWith<$Res>
    implements $PlaylistStateCopyWith<$Res> {
  factory _$$_PlaylistStateCopyWith(
          _$_PlaylistState value, $Res Function(_$_PlaylistState) then) =
      __$$_PlaylistStateCopyWithImpl<$Res>;
  @override
  $Res call({List<String> playlistNames});
}

/// @nodoc
class __$$_PlaylistStateCopyWithImpl<$Res>
    extends _$PlaylistStateCopyWithImpl<$Res>
    implements _$$_PlaylistStateCopyWith<$Res> {
  __$$_PlaylistStateCopyWithImpl(
      _$_PlaylistState _value, $Res Function(_$_PlaylistState) _then)
      : super(_value, (v) => _then(v as _$_PlaylistState));

  @override
  _$_PlaylistState get _value => super._value as _$_PlaylistState;

  @override
  $Res call({
    Object? playlistNames = freezed,
  }) {
    return _then(_$_PlaylistState(
      playlistNames: playlistNames == freezed
          ? _value._playlistNames
          : playlistNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_PlaylistState implements _PlaylistState {
  const _$_PlaylistState({required final List<String> playlistNames})
      : _playlistNames = playlistNames;

  final List<String> _playlistNames;
  @override
  List<String> get playlistNames {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlistNames);
  }

  @override
  String toString() {
    return 'PlaylistState(playlistNames: $playlistNames)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistState &&
            const DeepCollectionEquality()
                .equals(other._playlistNames, _playlistNames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_playlistNames));

  @JsonKey(ignore: true)
  @override
  _$$_PlaylistStateCopyWith<_$_PlaylistState> get copyWith =>
      __$$_PlaylistStateCopyWithImpl<_$_PlaylistState>(this, _$identity);
}

abstract class _PlaylistState implements PlaylistState {
  const factory _PlaylistState({required final List<String> playlistNames}) =
      _$_PlaylistState;

  @override
  List<String> get playlistNames;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistStateCopyWith<_$_PlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}
