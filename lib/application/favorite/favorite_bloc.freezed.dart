// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFavSong,
    required TResult Function(audioModel songData) addFavToDb,
    required TResult Function(int index) deleteFavSong,
    required TResult Function(bool isFavorite) favStateChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFavSong value) getFavSong,
    required TResult Function(AddFavToDb value) addFavToDb,
    required TResult Function(DeleteFavSong value) deleteFavSong,
    required TResult Function(FavStateChange value) favStateChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteEventCopyWith<$Res> {
  factory $FavoriteEventCopyWith(
          FavoriteEvent value, $Res Function(FavoriteEvent) then) =
      _$FavoriteEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoriteEventCopyWithImpl<$Res>
    implements $FavoriteEventCopyWith<$Res> {
  _$FavoriteEventCopyWithImpl(this._value, this._then);

  final FavoriteEvent _value;
  // ignore: unused_field
  final $Res Function(FavoriteEvent) _then;
}

/// @nodoc
abstract class _$$GetFavSongCopyWith<$Res> {
  factory _$$GetFavSongCopyWith(
          _$GetFavSong value, $Res Function(_$GetFavSong) then) =
      __$$GetFavSongCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetFavSongCopyWithImpl<$Res> extends _$FavoriteEventCopyWithImpl<$Res>
    implements _$$GetFavSongCopyWith<$Res> {
  __$$GetFavSongCopyWithImpl(
      _$GetFavSong _value, $Res Function(_$GetFavSong) _then)
      : super(_value, (v) => _then(v as _$GetFavSong));

  @override
  _$GetFavSong get _value => super._value as _$GetFavSong;
}

/// @nodoc

class _$GetFavSong implements GetFavSong {
  const _$GetFavSong();

  @override
  String toString() {
    return 'FavoriteEvent.getFavSong()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetFavSong);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFavSong,
    required TResult Function(audioModel songData) addFavToDb,
    required TResult Function(int index) deleteFavSong,
    required TResult Function(bool isFavorite) favStateChange,
  }) {
    return getFavSong();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
  }) {
    return getFavSong?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
    required TResult orElse(),
  }) {
    if (getFavSong != null) {
      return getFavSong();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFavSong value) getFavSong,
    required TResult Function(AddFavToDb value) addFavToDb,
    required TResult Function(DeleteFavSong value) deleteFavSong,
    required TResult Function(FavStateChange value) favStateChange,
  }) {
    return getFavSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
  }) {
    return getFavSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
    required TResult orElse(),
  }) {
    if (getFavSong != null) {
      return getFavSong(this);
    }
    return orElse();
  }
}

abstract class GetFavSong implements FavoriteEvent {
  const factory GetFavSong() = _$GetFavSong;
}

/// @nodoc
abstract class _$$AddFavToDbCopyWith<$Res> {
  factory _$$AddFavToDbCopyWith(
          _$AddFavToDb value, $Res Function(_$AddFavToDb) then) =
      __$$AddFavToDbCopyWithImpl<$Res>;
  $Res call({audioModel songData});
}

/// @nodoc
class __$$AddFavToDbCopyWithImpl<$Res> extends _$FavoriteEventCopyWithImpl<$Res>
    implements _$$AddFavToDbCopyWith<$Res> {
  __$$AddFavToDbCopyWithImpl(
      _$AddFavToDb _value, $Res Function(_$AddFavToDb) _then)
      : super(_value, (v) => _then(v as _$AddFavToDb));

  @override
  _$AddFavToDb get _value => super._value as _$AddFavToDb;

  @override
  $Res call({
    Object? songData = freezed,
  }) {
    return _then(_$AddFavToDb(
      songData: songData == freezed
          ? _value.songData
          : songData // ignore: cast_nullable_to_non_nullable
              as audioModel,
    ));
  }
}

/// @nodoc

class _$AddFavToDb implements AddFavToDb {
  const _$AddFavToDb({required this.songData});

  @override
  final audioModel songData;

  @override
  String toString() {
    return 'FavoriteEvent.addFavToDb(songData: $songData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFavToDb &&
            const DeepCollectionEquality().equals(other.songData, songData));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(songData));

  @JsonKey(ignore: true)
  @override
  _$$AddFavToDbCopyWith<_$AddFavToDb> get copyWith =>
      __$$AddFavToDbCopyWithImpl<_$AddFavToDb>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFavSong,
    required TResult Function(audioModel songData) addFavToDb,
    required TResult Function(int index) deleteFavSong,
    required TResult Function(bool isFavorite) favStateChange,
  }) {
    return addFavToDb(songData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
  }) {
    return addFavToDb?.call(songData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
    required TResult orElse(),
  }) {
    if (addFavToDb != null) {
      return addFavToDb(songData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFavSong value) getFavSong,
    required TResult Function(AddFavToDb value) addFavToDb,
    required TResult Function(DeleteFavSong value) deleteFavSong,
    required TResult Function(FavStateChange value) favStateChange,
  }) {
    return addFavToDb(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
  }) {
    return addFavToDb?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
    required TResult orElse(),
  }) {
    if (addFavToDb != null) {
      return addFavToDb(this);
    }
    return orElse();
  }
}

abstract class AddFavToDb implements FavoriteEvent {
  const factory AddFavToDb({required final audioModel songData}) = _$AddFavToDb;

  audioModel get songData;
  @JsonKey(ignore: true)
  _$$AddFavToDbCopyWith<_$AddFavToDb> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteFavSongCopyWith<$Res> {
  factory _$$DeleteFavSongCopyWith(
          _$DeleteFavSong value, $Res Function(_$DeleteFavSong) then) =
      __$$DeleteFavSongCopyWithImpl<$Res>;
  $Res call({int index});
}

/// @nodoc
class __$$DeleteFavSongCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res>
    implements _$$DeleteFavSongCopyWith<$Res> {
  __$$DeleteFavSongCopyWithImpl(
      _$DeleteFavSong _value, $Res Function(_$DeleteFavSong) _then)
      : super(_value, (v) => _then(v as _$DeleteFavSong));

  @override
  _$DeleteFavSong get _value => super._value as _$DeleteFavSong;

  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$DeleteFavSong(
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteFavSong implements DeleteFavSong {
  const _$DeleteFavSong({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'FavoriteEvent.deleteFavSong(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteFavSong &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$$DeleteFavSongCopyWith<_$DeleteFavSong> get copyWith =>
      __$$DeleteFavSongCopyWithImpl<_$DeleteFavSong>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFavSong,
    required TResult Function(audioModel songData) addFavToDb,
    required TResult Function(int index) deleteFavSong,
    required TResult Function(bool isFavorite) favStateChange,
  }) {
    return deleteFavSong(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
  }) {
    return deleteFavSong?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
    required TResult orElse(),
  }) {
    if (deleteFavSong != null) {
      return deleteFavSong(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFavSong value) getFavSong,
    required TResult Function(AddFavToDb value) addFavToDb,
    required TResult Function(DeleteFavSong value) deleteFavSong,
    required TResult Function(FavStateChange value) favStateChange,
  }) {
    return deleteFavSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
  }) {
    return deleteFavSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
    required TResult orElse(),
  }) {
    if (deleteFavSong != null) {
      return deleteFavSong(this);
    }
    return orElse();
  }
}

abstract class DeleteFavSong implements FavoriteEvent {
  const factory DeleteFavSong({required final int index}) = _$DeleteFavSong;

  int get index;
  @JsonKey(ignore: true)
  _$$DeleteFavSongCopyWith<_$DeleteFavSong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavStateChangeCopyWith<$Res> {
  factory _$$FavStateChangeCopyWith(
          _$FavStateChange value, $Res Function(_$FavStateChange) then) =
      __$$FavStateChangeCopyWithImpl<$Res>;
  $Res call({bool isFavorite});
}

/// @nodoc
class __$$FavStateChangeCopyWithImpl<$Res>
    extends _$FavoriteEventCopyWithImpl<$Res>
    implements _$$FavStateChangeCopyWith<$Res> {
  __$$FavStateChangeCopyWithImpl(
      _$FavStateChange _value, $Res Function(_$FavStateChange) _then)
      : super(_value, (v) => _then(v as _$FavStateChange));

  @override
  _$FavStateChange get _value => super._value as _$FavStateChange;

  @override
  $Res call({
    Object? isFavorite = freezed,
  }) {
    return _then(_$FavStateChange(
      isFavorite: isFavorite == freezed
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FavStateChange implements FavStateChange {
  const _$FavStateChange({required this.isFavorite});

  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'FavoriteEvent.favStateChange(isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavStateChange &&
            const DeepCollectionEquality()
                .equals(other.isFavorite, isFavorite));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isFavorite));

  @JsonKey(ignore: true)
  @override
  _$$FavStateChangeCopyWith<_$FavStateChange> get copyWith =>
      __$$FavStateChangeCopyWithImpl<_$FavStateChange>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getFavSong,
    required TResult Function(audioModel songData) addFavToDb,
    required TResult Function(int index) deleteFavSong,
    required TResult Function(bool isFavorite) favStateChange,
  }) {
    return favStateChange(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
  }) {
    return favStateChange?.call(isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getFavSong,
    TResult Function(audioModel songData)? addFavToDb,
    TResult Function(int index)? deleteFavSong,
    TResult Function(bool isFavorite)? favStateChange,
    required TResult orElse(),
  }) {
    if (favStateChange != null) {
      return favStateChange(isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetFavSong value) getFavSong,
    required TResult Function(AddFavToDb value) addFavToDb,
    required TResult Function(DeleteFavSong value) deleteFavSong,
    required TResult Function(FavStateChange value) favStateChange,
  }) {
    return favStateChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
  }) {
    return favStateChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetFavSong value)? getFavSong,
    TResult Function(AddFavToDb value)? addFavToDb,
    TResult Function(DeleteFavSong value)? deleteFavSong,
    TResult Function(FavStateChange value)? favStateChange,
    required TResult orElse(),
  }) {
    if (favStateChange != null) {
      return favStateChange(this);
    }
    return orElse();
  }
}

abstract class FavStateChange implements FavoriteEvent {
  const factory FavStateChange({required final bool isFavorite}) =
      _$FavStateChange;

  bool get isFavorite;
  @JsonKey(ignore: true)
  _$$FavStateChangeCopyWith<_$FavStateChange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavoriteState {
  List<audioModel> get favSongList => throw _privateConstructorUsedError;
  List<Audio> get finalFavSongs =>
      throw _privateConstructorUsedError; // For Now playing Screen
  bool? get isFav => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteStateCopyWith<FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res>;
  $Res call(
      {List<audioModel> favSongList, List<Audio> finalFavSongs, bool? isFav});
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  final FavoriteState _value;
  // ignore: unused_field
  final $Res Function(FavoriteState) _then;

  @override
  $Res call({
    Object? favSongList = freezed,
    Object? finalFavSongs = freezed,
    Object? isFav = freezed,
  }) {
    return _then(_value.copyWith(
      favSongList: favSongList == freezed
          ? _value.favSongList
          : favSongList // ignore: cast_nullable_to_non_nullable
              as List<audioModel>,
      finalFavSongs: finalFavSongs == freezed
          ? _value.finalFavSongs
          : finalFavSongs // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
      isFav: isFav == freezed
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_FavoriteStateCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$$_FavoriteStateCopyWith(
          _$_FavoriteState value, $Res Function(_$_FavoriteState) then) =
      __$$_FavoriteStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<audioModel> favSongList, List<Audio> finalFavSongs, bool? isFav});
}

/// @nodoc
class __$$_FavoriteStateCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res>
    implements _$$_FavoriteStateCopyWith<$Res> {
  __$$_FavoriteStateCopyWithImpl(
      _$_FavoriteState _value, $Res Function(_$_FavoriteState) _then)
      : super(_value, (v) => _then(v as _$_FavoriteState));

  @override
  _$_FavoriteState get _value => super._value as _$_FavoriteState;

  @override
  $Res call({
    Object? favSongList = freezed,
    Object? finalFavSongs = freezed,
    Object? isFav = freezed,
  }) {
    return _then(_$_FavoriteState(
      favSongList: favSongList == freezed
          ? _value._favSongList
          : favSongList // ignore: cast_nullable_to_non_nullable
              as List<audioModel>,
      finalFavSongs: finalFavSongs == freezed
          ? _value._finalFavSongs
          : finalFavSongs // ignore: cast_nullable_to_non_nullable
              as List<Audio>,
      isFav: isFav == freezed
          ? _value.isFav
          : isFav // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_FavoriteState implements _FavoriteState {
  const _$_FavoriteState(
      {required final List<audioModel> favSongList,
      required final List<Audio> finalFavSongs,
      this.isFav})
      : _favSongList = favSongList,
        _finalFavSongs = finalFavSongs;

  final List<audioModel> _favSongList;
  @override
  List<audioModel> get favSongList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favSongList);
  }

  final List<Audio> _finalFavSongs;
  @override
  List<Audio> get finalFavSongs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_finalFavSongs);
  }

// For Now playing Screen
  @override
  final bool? isFav;

  @override
  String toString() {
    return 'FavoriteState(favSongList: $favSongList, finalFavSongs: $finalFavSongs, isFav: $isFav)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteState &&
            const DeepCollectionEquality()
                .equals(other._favSongList, _favSongList) &&
            const DeepCollectionEquality()
                .equals(other._finalFavSongs, _finalFavSongs) &&
            const DeepCollectionEquality().equals(other.isFav, isFav));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favSongList),
      const DeepCollectionEquality().hash(_finalFavSongs),
      const DeepCollectionEquality().hash(isFav));

  @JsonKey(ignore: true)
  @override
  _$$_FavoriteStateCopyWith<_$_FavoriteState> get copyWith =>
      __$$_FavoriteStateCopyWithImpl<_$_FavoriteState>(this, _$identity);
}

abstract class _FavoriteState implements FavoriteState {
  const factory _FavoriteState(
      {required final List<audioModel> favSongList,
      required final List<Audio> finalFavSongs,
      final bool? isFav}) = _$_FavoriteState;

  @override
  List<audioModel> get favSongList;
  @override
  List<Audio> get finalFavSongs;
  @override // For Now playing Screen
  bool? get isFav;
  @override
  @JsonKey(ignore: true)
  _$$_FavoriteStateCopyWith<_$_FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}
