// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'playlist_info_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistInfoEvent {
  String get boxKey => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String boxKey) getPlaylistSongs,
    required TResult Function(String boxKey, audioModel songDatas)
        addSongToPlaylist,
    required TResult Function(String boxKey, int index) deletePlySong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String boxKey)? getPlaylistSongs,
    TResult Function(String boxKey, audioModel songDatas)? addSongToPlaylist,
    TResult Function(String boxKey, int index)? deletePlySong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String boxKey)? getPlaylistSongs,
    TResult Function(String boxKey, audioModel songDatas)? addSongToPlaylist,
    TResult Function(String boxKey, int index)? deletePlySong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaylistSongs value) getPlaylistSongs,
    required TResult Function(AddSongToPlaylist value) addSongToPlaylist,
    required TResult Function(DeletePlySong value) deletePlySong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlaylistSongs value)? getPlaylistSongs,
    TResult Function(AddSongToPlaylist value)? addSongToPlaylist,
    TResult Function(DeletePlySong value)? deletePlySong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaylistSongs value)? getPlaylistSongs,
    TResult Function(AddSongToPlaylist value)? addSongToPlaylist,
    TResult Function(DeletePlySong value)? deletePlySong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistInfoEventCopyWith<PlaylistInfoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistInfoEventCopyWith<$Res> {
  factory $PlaylistInfoEventCopyWith(
          PlaylistInfoEvent value, $Res Function(PlaylistInfoEvent) then) =
      _$PlaylistInfoEventCopyWithImpl<$Res>;
  $Res call({String boxKey});
}

/// @nodoc
class _$PlaylistInfoEventCopyWithImpl<$Res>
    implements $PlaylistInfoEventCopyWith<$Res> {
  _$PlaylistInfoEventCopyWithImpl(this._value, this._then);

  final PlaylistInfoEvent _value;
  // ignore: unused_field
  final $Res Function(PlaylistInfoEvent) _then;

  @override
  $Res call({
    Object? boxKey = freezed,
  }) {
    return _then(_value.copyWith(
      boxKey: boxKey == freezed
          ? _value.boxKey
          : boxKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$GetPlaylistSongsCopyWith<$Res>
    implements $PlaylistInfoEventCopyWith<$Res> {
  factory _$$GetPlaylistSongsCopyWith(
          _$GetPlaylistSongs value, $Res Function(_$GetPlaylistSongs) then) =
      __$$GetPlaylistSongsCopyWithImpl<$Res>;
  @override
  $Res call({String boxKey});
}

/// @nodoc
class __$$GetPlaylistSongsCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res>
    implements _$$GetPlaylistSongsCopyWith<$Res> {
  __$$GetPlaylistSongsCopyWithImpl(
      _$GetPlaylistSongs _value, $Res Function(_$GetPlaylistSongs) _then)
      : super(_value, (v) => _then(v as _$GetPlaylistSongs));

  @override
  _$GetPlaylistSongs get _value => super._value as _$GetPlaylistSongs;

  @override
  $Res call({
    Object? boxKey = freezed,
  }) {
    return _then(_$GetPlaylistSongs(
      boxKey: boxKey == freezed
          ? _value.boxKey
          : boxKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetPlaylistSongs implements GetPlaylistSongs {
  const _$GetPlaylistSongs({required this.boxKey});

  @override
  final String boxKey;

  @override
  String toString() {
    return 'PlaylistInfoEvent.getPlaylistSongs(boxKey: $boxKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPlaylistSongs &&
            const DeepCollectionEquality().equals(other.boxKey, boxKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(boxKey));

  @JsonKey(ignore: true)
  @override
  _$$GetPlaylistSongsCopyWith<_$GetPlaylistSongs> get copyWith =>
      __$$GetPlaylistSongsCopyWithImpl<_$GetPlaylistSongs>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String boxKey) getPlaylistSongs,
    required TResult Function(String boxKey, audioModel songDatas)
        addSongToPlaylist,
    required TResult Function(String boxKey, int index) deletePlySong,
  }) {
    return getPlaylistSongs(boxKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String boxKey)? getPlaylistSongs,
    TResult Function(String boxKey, audioModel songDatas)? addSongToPlaylist,
    TResult Function(String boxKey, int index)? deletePlySong,
  }) {
    return getPlaylistSongs?.call(boxKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String boxKey)? getPlaylistSongs,
    TResult Function(String boxKey, audioModel songDatas)? addSongToPlaylist,
    TResult Function(String boxKey, int index)? deletePlySong,
    required TResult orElse(),
  }) {
    if (getPlaylistSongs != null) {
      return getPlaylistSongs(boxKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaylistSongs value) getPlaylistSongs,
    required TResult Function(AddSongToPlaylist value) addSongToPlaylist,
    required TResult Function(DeletePlySong value) deletePlySong,
  }) {
    return getPlaylistSongs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlaylistSongs value)? getPlaylistSongs,
    TResult Function(AddSongToPlaylist value)? addSongToPlaylist,
    TResult Function(DeletePlySong value)? deletePlySong,
  }) {
    return getPlaylistSongs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaylistSongs value)? getPlaylistSongs,
    TResult Function(AddSongToPlaylist value)? addSongToPlaylist,
    TResult Function(DeletePlySong value)? deletePlySong,
    required TResult orElse(),
  }) {
    if (getPlaylistSongs != null) {
      return getPlaylistSongs(this);
    }
    return orElse();
  }
}

abstract class GetPlaylistSongs implements PlaylistInfoEvent {
  const factory GetPlaylistSongs({required final String boxKey}) =
      _$GetPlaylistSongs;

  @override
  String get boxKey;
  @override
  @JsonKey(ignore: true)
  _$$GetPlaylistSongsCopyWith<_$GetPlaylistSongs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSongToPlaylistCopyWith<$Res>
    implements $PlaylistInfoEventCopyWith<$Res> {
  factory _$$AddSongToPlaylistCopyWith(
          _$AddSongToPlaylist value, $Res Function(_$AddSongToPlaylist) then) =
      __$$AddSongToPlaylistCopyWithImpl<$Res>;
  @override
  $Res call({String boxKey, audioModel songDatas});
}

/// @nodoc
class __$$AddSongToPlaylistCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res>
    implements _$$AddSongToPlaylistCopyWith<$Res> {
  __$$AddSongToPlaylistCopyWithImpl(
      _$AddSongToPlaylist _value, $Res Function(_$AddSongToPlaylist) _then)
      : super(_value, (v) => _then(v as _$AddSongToPlaylist));

  @override
  _$AddSongToPlaylist get _value => super._value as _$AddSongToPlaylist;

  @override
  $Res call({
    Object? boxKey = freezed,
    Object? songDatas = freezed,
  }) {
    return _then(_$AddSongToPlaylist(
      boxKey: boxKey == freezed
          ? _value.boxKey
          : boxKey // ignore: cast_nullable_to_non_nullable
              as String,
      songDatas: songDatas == freezed
          ? _value.songDatas
          : songDatas // ignore: cast_nullable_to_non_nullable
              as audioModel,
    ));
  }
}

/// @nodoc

class _$AddSongToPlaylist implements AddSongToPlaylist {
  const _$AddSongToPlaylist({required this.boxKey, required this.songDatas});

  @override
  final String boxKey;
  @override
  final audioModel songDatas;

  @override
  String toString() {
    return 'PlaylistInfoEvent.addSongToPlaylist(boxKey: $boxKey, songDatas: $songDatas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSongToPlaylist &&
            const DeepCollectionEquality().equals(other.boxKey, boxKey) &&
            const DeepCollectionEquality().equals(other.songDatas, songDatas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(boxKey),
      const DeepCollectionEquality().hash(songDatas));

  @JsonKey(ignore: true)
  @override
  _$$AddSongToPlaylistCopyWith<_$AddSongToPlaylist> get copyWith =>
      __$$AddSongToPlaylistCopyWithImpl<_$AddSongToPlaylist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String boxKey) getPlaylistSongs,
    required TResult Function(String boxKey, audioModel songDatas)
        addSongToPlaylist,
    required TResult Function(String boxKey, int index) deletePlySong,
  }) {
    return addSongToPlaylist(boxKey, songDatas);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String boxKey)? getPlaylistSongs,
    TResult Function(String boxKey, audioModel songDatas)? addSongToPlaylist,
    TResult Function(String boxKey, int index)? deletePlySong,
  }) {
    return addSongToPlaylist?.call(boxKey, songDatas);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String boxKey)? getPlaylistSongs,
    TResult Function(String boxKey, audioModel songDatas)? addSongToPlaylist,
    TResult Function(String boxKey, int index)? deletePlySong,
    required TResult orElse(),
  }) {
    if (addSongToPlaylist != null) {
      return addSongToPlaylist(boxKey, songDatas);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaylistSongs value) getPlaylistSongs,
    required TResult Function(AddSongToPlaylist value) addSongToPlaylist,
    required TResult Function(DeletePlySong value) deletePlySong,
  }) {
    return addSongToPlaylist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlaylistSongs value)? getPlaylistSongs,
    TResult Function(AddSongToPlaylist value)? addSongToPlaylist,
    TResult Function(DeletePlySong value)? deletePlySong,
  }) {
    return addSongToPlaylist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaylistSongs value)? getPlaylistSongs,
    TResult Function(AddSongToPlaylist value)? addSongToPlaylist,
    TResult Function(DeletePlySong value)? deletePlySong,
    required TResult orElse(),
  }) {
    if (addSongToPlaylist != null) {
      return addSongToPlaylist(this);
    }
    return orElse();
  }
}

abstract class AddSongToPlaylist implements PlaylistInfoEvent {
  const factory AddSongToPlaylist(
      {required final String boxKey,
      required final audioModel songDatas}) = _$AddSongToPlaylist;

  @override
  String get boxKey;
  audioModel get songDatas;
  @override
  @JsonKey(ignore: true)
  _$$AddSongToPlaylistCopyWith<_$AddSongToPlaylist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePlySongCopyWith<$Res>
    implements $PlaylistInfoEventCopyWith<$Res> {
  factory _$$DeletePlySongCopyWith(
          _$DeletePlySong value, $Res Function(_$DeletePlySong) then) =
      __$$DeletePlySongCopyWithImpl<$Res>;
  @override
  $Res call({String boxKey, int index});
}

/// @nodoc
class __$$DeletePlySongCopyWithImpl<$Res>
    extends _$PlaylistInfoEventCopyWithImpl<$Res>
    implements _$$DeletePlySongCopyWith<$Res> {
  __$$DeletePlySongCopyWithImpl(
      _$DeletePlySong _value, $Res Function(_$DeletePlySong) _then)
      : super(_value, (v) => _then(v as _$DeletePlySong));

  @override
  _$DeletePlySong get _value => super._value as _$DeletePlySong;

  @override
  $Res call({
    Object? boxKey = freezed,
    Object? index = freezed,
  }) {
    return _then(_$DeletePlySong(
      boxKey: boxKey == freezed
          ? _value.boxKey
          : boxKey // ignore: cast_nullable_to_non_nullable
              as String,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeletePlySong implements DeletePlySong {
  const _$DeletePlySong({required this.boxKey, required this.index});

  @override
  final String boxKey;
  @override
  final int index;

  @override
  String toString() {
    return 'PlaylistInfoEvent.deletePlySong(boxKey: $boxKey, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePlySong &&
            const DeepCollectionEquality().equals(other.boxKey, boxKey) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(boxKey),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$DeletePlySongCopyWith<_$DeletePlySong> get copyWith =>
      __$$DeletePlySongCopyWithImpl<_$DeletePlySong>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String boxKey) getPlaylistSongs,
    required TResult Function(String boxKey, audioModel songDatas)
        addSongToPlaylist,
    required TResult Function(String boxKey, int index) deletePlySong,
  }) {
    return deletePlySong(boxKey, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String boxKey)? getPlaylistSongs,
    TResult Function(String boxKey, audioModel songDatas)? addSongToPlaylist,
    TResult Function(String boxKey, int index)? deletePlySong,
  }) {
    return deletePlySong?.call(boxKey, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String boxKey)? getPlaylistSongs,
    TResult Function(String boxKey, audioModel songDatas)? addSongToPlaylist,
    TResult Function(String boxKey, int index)? deletePlySong,
    required TResult orElse(),
  }) {
    if (deletePlySong != null) {
      return deletePlySong(boxKey, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaylistSongs value) getPlaylistSongs,
    required TResult Function(AddSongToPlaylist value) addSongToPlaylist,
    required TResult Function(DeletePlySong value) deletePlySong,
  }) {
    return deletePlySong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetPlaylistSongs value)? getPlaylistSongs,
    TResult Function(AddSongToPlaylist value)? addSongToPlaylist,
    TResult Function(DeletePlySong value)? deletePlySong,
  }) {
    return deletePlySong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaylistSongs value)? getPlaylistSongs,
    TResult Function(AddSongToPlaylist value)? addSongToPlaylist,
    TResult Function(DeletePlySong value)? deletePlySong,
    required TResult orElse(),
  }) {
    if (deletePlySong != null) {
      return deletePlySong(this);
    }
    return orElse();
  }
}

abstract class DeletePlySong implements PlaylistInfoEvent {
  const factory DeletePlySong(
      {required final String boxKey,
      required final int index}) = _$DeletePlySong;

  @override
  String get boxKey;
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$DeletePlySongCopyWith<_$DeletePlySong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlaylistInfoState {
  List<audioModel> get playlistSongs => throw _privateConstructorUsedError;
  List<Audio> get finalPlaylistSongs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistInfoStateCopyWith<PlaylistInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistInfoStateCopyWith<$Res> {
  factory $PlaylistInfoStateCopyWith(
          PlaylistInfoState value, $Res Function(PlaylistInfoState) then) =
      _$PlaylistInfoStateCopyWithImpl<$Res>;
  $Res call({List<audioModel> playlistSongs, List<Audio> finalPlaylistSongs});
}

/// @nodoc
class _$PlaylistInfoStateCopyWithImpl<$Res>
    implements $PlaylistInfoStateCopyWith<$Res> {
  _$PlaylistInfoStateCopyWithImpl(this._value, this._then);

  final PlaylistInfoState _value;
  // ignore: unused_field
  final $Res Function(PlaylistInfoState) _then;

  @override
  $Res call({
    Object? playlistSongs = freezed,
    Object? finalPlaylistSongs = freezed,
  }) {
    return _then(_value.copyWith(
      playlistSongs: playlistSongs == freezed
          ? _value.playlistSongs
          : playlistSongs // ignore: cast_nullable_to_non_nullable
              as List<audioModel>,
      finalPlaylistSongs: finalPlaylistSongs == freezed
          ? _value.finalPlaylistSongs
          : finalPlaylistSongs // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
    ));
  }
}

/// @nodoc
abstract class _$$_PlaylistInfoStateCopyWith<$Res>
    implements $PlaylistInfoStateCopyWith<$Res> {
  factory _$$_PlaylistInfoStateCopyWith(_$_PlaylistInfoState value,
          $Res Function(_$_PlaylistInfoState) then) =
      __$$_PlaylistInfoStateCopyWithImpl<$Res>;
  @override
  $Res call({List<audioModel> playlistSongs, List<Audio> finalPlaylistSongs});
}

/// @nodoc
class __$$_PlaylistInfoStateCopyWithImpl<$Res>
    extends _$PlaylistInfoStateCopyWithImpl<$Res>
    implements _$$_PlaylistInfoStateCopyWith<$Res> {
  __$$_PlaylistInfoStateCopyWithImpl(
      _$_PlaylistInfoState _value, $Res Function(_$_PlaylistInfoState) _then)
      : super(_value, (v) => _then(v as _$_PlaylistInfoState));

  @override
  _$_PlaylistInfoState get _value => super._value as _$_PlaylistInfoState;

  @override
  $Res call({
    Object? playlistSongs = freezed,
    Object? finalPlaylistSongs = freezed,
  }) {
    return _then(_$_PlaylistInfoState(
      playlistSongs: playlistSongs == freezed
          ? _value._playlistSongs
          : playlistSongs // ignore: cast_nullable_to_non_nullable
              as List<audioModel>,
      finalPlaylistSongs: finalPlaylistSongs == freezed
          ? _value._finalPlaylistSongs
          : finalPlaylistSongs // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
    ));
  }
}

/// @nodoc

class _$_PlaylistInfoState implements _PlaylistInfoState {
  const _$_PlaylistInfoState(
      {required final List<audioModel> playlistSongs,
      required final List<Audio> finalPlaylistSongs})
      : _playlistSongs = playlistSongs,
        _finalPlaylistSongs = finalPlaylistSongs;

  final List<audioModel> _playlistSongs;
  @override
  List<audioModel> get playlistSongs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlistSongs);
  }

  final List<Audio> _finalPlaylistSongs;
  @override
  List<Audio> get finalPlaylistSongs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_finalPlaylistSongs);
  }

  @override
  String toString() {
    return 'PlaylistInfoState(playlistSongs: $playlistSongs, finalPlaylistSongs: $finalPlaylistSongs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistInfoState &&
            const DeepCollectionEquality()
                .equals(other._playlistSongs, _playlistSongs) &&
            const DeepCollectionEquality()
                .equals(other._finalPlaylistSongs, _finalPlaylistSongs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_playlistSongs),
      const DeepCollectionEquality().hash(_finalPlaylistSongs));

  @JsonKey(ignore: true)
  @override
  _$$_PlaylistInfoStateCopyWith<_$_PlaylistInfoState> get copyWith =>
      __$$_PlaylistInfoStateCopyWithImpl<_$_PlaylistInfoState>(
          this, _$identity);
}

abstract class _PlaylistInfoState implements PlaylistInfoState {
  const factory _PlaylistInfoState(
      {required final List<audioModel> playlistSongs,
      required final List<Audio> finalPlaylistSongs}) = _$_PlaylistInfoState;

  @override
  List<audioModel> get playlistSongs;
  @override
  List<Audio> get finalPlaylistSongs;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistInfoStateCopyWith<_$_PlaylistInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
