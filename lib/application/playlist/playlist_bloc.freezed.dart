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
    required TResult Function(String plylistName) createPlylistNames,
    required TResult Function(String selectedPlaylist) multiSelection,
    required TResult Function() unselectAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String plylistName)? createPlylistNames,
    TResult Function(String selectedPlaylist)? multiSelection,
    TResult Function()? unselectAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String plylistName)? createPlylistNames,
    TResult Function(String selectedPlaylist)? multiSelection,
    TResult Function()? unselectAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatePlylistNames value) createPlylistNames,
    required TResult Function(MultiSelection value) multiSelection,
    required TResult Function(UnselectAll value) unselectAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreatePlylistNames value)? createPlylistNames,
    TResult Function(MultiSelection value)? multiSelection,
    TResult Function(UnselectAll value)? unselectAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatePlylistNames value)? createPlylistNames,
    TResult Function(MultiSelection value)? multiSelection,
    TResult Function(UnselectAll value)? unselectAll,
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
abstract class _$$CreatePlylistNamesCopyWith<$Res> {
  factory _$$CreatePlylistNamesCopyWith(_$CreatePlylistNames value,
          $Res Function(_$CreatePlylistNames) then) =
      __$$CreatePlylistNamesCopyWithImpl<$Res>;
  $Res call({String plylistName});
}

/// @nodoc
class __$$CreatePlylistNamesCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res>
    implements _$$CreatePlylistNamesCopyWith<$Res> {
  __$$CreatePlylistNamesCopyWithImpl(
      _$CreatePlylistNames _value, $Res Function(_$CreatePlylistNames) _then)
      : super(_value, (v) => _then(v as _$CreatePlylistNames));

  @override
  _$CreatePlylistNames get _value => super._value as _$CreatePlylistNames;

  @override
  $Res call({
    Object? plylistName = freezed,
  }) {
    return _then(_$CreatePlylistNames(
      plylistName: plylistName == freezed
          ? _value.plylistName
          : plylistName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreatePlylistNames implements CreatePlylistNames {
  const _$CreatePlylistNames({required this.plylistName});

  @override
  final String plylistName;

  @override
  String toString() {
    return 'PlaylistEvent.createPlylistNames(plylistName: $plylistName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePlylistNames &&
            const DeepCollectionEquality()
                .equals(other.plylistName, plylistName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(plylistName));

  @JsonKey(ignore: true)
  @override
  _$$CreatePlylistNamesCopyWith<_$CreatePlylistNames> get copyWith =>
      __$$CreatePlylistNamesCopyWithImpl<_$CreatePlylistNames>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String plylistName) createPlylistNames,
    required TResult Function(String selectedPlaylist) multiSelection,
    required TResult Function() unselectAll,
  }) {
    return createPlylistNames(plylistName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String plylistName)? createPlylistNames,
    TResult Function(String selectedPlaylist)? multiSelection,
    TResult Function()? unselectAll,
  }) {
    return createPlylistNames?.call(plylistName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String plylistName)? createPlylistNames,
    TResult Function(String selectedPlaylist)? multiSelection,
    TResult Function()? unselectAll,
    required TResult orElse(),
  }) {
    if (createPlylistNames != null) {
      return createPlylistNames(plylistName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatePlylistNames value) createPlylistNames,
    required TResult Function(MultiSelection value) multiSelection,
    required TResult Function(UnselectAll value) unselectAll,
  }) {
    return createPlylistNames(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreatePlylistNames value)? createPlylistNames,
    TResult Function(MultiSelection value)? multiSelection,
    TResult Function(UnselectAll value)? unselectAll,
  }) {
    return createPlylistNames?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatePlylistNames value)? createPlylistNames,
    TResult Function(MultiSelection value)? multiSelection,
    TResult Function(UnselectAll value)? unselectAll,
    required TResult orElse(),
  }) {
    if (createPlylistNames != null) {
      return createPlylistNames(this);
    }
    return orElse();
  }
}

abstract class CreatePlylistNames implements PlaylistEvent {
  const factory CreatePlylistNames({required final String plylistName}) =
      _$CreatePlylistNames;

  String get plylistName;
  @JsonKey(ignore: true)
  _$$CreatePlylistNamesCopyWith<_$CreatePlylistNames> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MultiSelectionCopyWith<$Res> {
  factory _$$MultiSelectionCopyWith(
          _$MultiSelection value, $Res Function(_$MultiSelection) then) =
      __$$MultiSelectionCopyWithImpl<$Res>;
  $Res call({String selectedPlaylist});
}

/// @nodoc
class __$$MultiSelectionCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res>
    implements _$$MultiSelectionCopyWith<$Res> {
  __$$MultiSelectionCopyWithImpl(
      _$MultiSelection _value, $Res Function(_$MultiSelection) _then)
      : super(_value, (v) => _then(v as _$MultiSelection));

  @override
  _$MultiSelection get _value => super._value as _$MultiSelection;

  @override
  $Res call({
    Object? selectedPlaylist = freezed,
  }) {
    return _then(_$MultiSelection(
      selectedPlaylist: selectedPlaylist == freezed
          ? _value.selectedPlaylist
          : selectedPlaylist // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MultiSelection implements MultiSelection {
  const _$MultiSelection({required this.selectedPlaylist});

  @override
  final String selectedPlaylist;

  @override
  String toString() {
    return 'PlaylistEvent.multiSelection(selectedPlaylist: $selectedPlaylist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MultiSelection &&
            const DeepCollectionEquality()
                .equals(other.selectedPlaylist, selectedPlaylist));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectedPlaylist));

  @JsonKey(ignore: true)
  @override
  _$$MultiSelectionCopyWith<_$MultiSelection> get copyWith =>
      __$$MultiSelectionCopyWithImpl<_$MultiSelection>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String plylistName) createPlylistNames,
    required TResult Function(String selectedPlaylist) multiSelection,
    required TResult Function() unselectAll,
  }) {
    return multiSelection(selectedPlaylist);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String plylistName)? createPlylistNames,
    TResult Function(String selectedPlaylist)? multiSelection,
    TResult Function()? unselectAll,
  }) {
    return multiSelection?.call(selectedPlaylist);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String plylistName)? createPlylistNames,
    TResult Function(String selectedPlaylist)? multiSelection,
    TResult Function()? unselectAll,
    required TResult orElse(),
  }) {
    if (multiSelection != null) {
      return multiSelection(selectedPlaylist);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatePlylistNames value) createPlylistNames,
    required TResult Function(MultiSelection value) multiSelection,
    required TResult Function(UnselectAll value) unselectAll,
  }) {
    return multiSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreatePlylistNames value)? createPlylistNames,
    TResult Function(MultiSelection value)? multiSelection,
    TResult Function(UnselectAll value)? unselectAll,
  }) {
    return multiSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatePlylistNames value)? createPlylistNames,
    TResult Function(MultiSelection value)? multiSelection,
    TResult Function(UnselectAll value)? unselectAll,
    required TResult orElse(),
  }) {
    if (multiSelection != null) {
      return multiSelection(this);
    }
    return orElse();
  }
}

abstract class MultiSelection implements PlaylistEvent {
  const factory MultiSelection({required final String selectedPlaylist}) =
      _$MultiSelection;

  String get selectedPlaylist;
  @JsonKey(ignore: true)
  _$$MultiSelectionCopyWith<_$MultiSelection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnselectAllCopyWith<$Res> {
  factory _$$UnselectAllCopyWith(
          _$UnselectAll value, $Res Function(_$UnselectAll) then) =
      __$$UnselectAllCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnselectAllCopyWithImpl<$Res>
    extends _$PlaylistEventCopyWithImpl<$Res>
    implements _$$UnselectAllCopyWith<$Res> {
  __$$UnselectAllCopyWithImpl(
      _$UnselectAll _value, $Res Function(_$UnselectAll) _then)
      : super(_value, (v) => _then(v as _$UnselectAll));

  @override
  _$UnselectAll get _value => super._value as _$UnselectAll;
}

/// @nodoc

class _$UnselectAll implements UnselectAll {
  const _$UnselectAll();

  @override
  String toString() {
    return 'PlaylistEvent.unselectAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnselectAll);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String plylistName) createPlylistNames,
    required TResult Function(String selectedPlaylist) multiSelection,
    required TResult Function() unselectAll,
  }) {
    return unselectAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String plylistName)? createPlylistNames,
    TResult Function(String selectedPlaylist)? multiSelection,
    TResult Function()? unselectAll,
  }) {
    return unselectAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String plylistName)? createPlylistNames,
    TResult Function(String selectedPlaylist)? multiSelection,
    TResult Function()? unselectAll,
    required TResult orElse(),
  }) {
    if (unselectAll != null) {
      return unselectAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreatePlylistNames value) createPlylistNames,
    required TResult Function(MultiSelection value) multiSelection,
    required TResult Function(UnselectAll value) unselectAll,
  }) {
    return unselectAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreatePlylistNames value)? createPlylistNames,
    TResult Function(MultiSelection value)? multiSelection,
    TResult Function(UnselectAll value)? unselectAll,
  }) {
    return unselectAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreatePlylistNames value)? createPlylistNames,
    TResult Function(MultiSelection value)? multiSelection,
    TResult Function(UnselectAll value)? unselectAll,
    required TResult orElse(),
  }) {
    if (unselectAll != null) {
      return unselectAll(this);
    }
    return orElse();
  }
}

abstract class UnselectAll implements PlaylistEvent {
  const factory UnselectAll() = _$UnselectAll;
}

/// @nodoc
mixin _$PlaylistState {
  List<String> get playlistNames => throw _privateConstructorUsedError;
  List<String> get selectedList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistStateCopyWith<PlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistStateCopyWith<$Res> {
  factory $PlaylistStateCopyWith(
          PlaylistState value, $Res Function(PlaylistState) then) =
      _$PlaylistStateCopyWithImpl<$Res>;
  $Res call({List<String> playlistNames, List<String> selectedList});
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
    Object? selectedList = freezed,
  }) {
    return _then(_value.copyWith(
      playlistNames: playlistNames == freezed
          ? _value.playlistNames
          : playlistNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedList: selectedList == freezed
          ? _value.selectedList
          : selectedList // ignore: cast_nullable_to_non_nullable
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
  $Res call({List<String> playlistNames, List<String> selectedList});
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
    Object? selectedList = freezed,
  }) {
    return _then(_$_PlaylistState(
      playlistNames: playlistNames == freezed
          ? _value._playlistNames
          : playlistNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedList: selectedList == freezed
          ? _value._selectedList
          : selectedList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_PlaylistState implements _PlaylistState {
  const _$_PlaylistState(
      {required final List<String> playlistNames,
      required final List<String> selectedList})
      : _playlistNames = playlistNames,
        _selectedList = selectedList;

  final List<String> _playlistNames;
  @override
  List<String> get playlistNames {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlistNames);
  }

  final List<String> _selectedList;
  @override
  List<String> get selectedList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedList);
  }

  @override
  String toString() {
    return 'PlaylistState(playlistNames: $playlistNames, selectedList: $selectedList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaylistState &&
            const DeepCollectionEquality()
                .equals(other._playlistNames, _playlistNames) &&
            const DeepCollectionEquality()
                .equals(other._selectedList, _selectedList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_playlistNames),
      const DeepCollectionEquality().hash(_selectedList));

  @JsonKey(ignore: true)
  @override
  _$$_PlaylistStateCopyWith<_$_PlaylistState> get copyWith =>
      __$$_PlaylistStateCopyWithImpl<_$_PlaylistState>(this, _$identity);
}

abstract class _PlaylistState implements PlaylistState {
  const factory _PlaylistState(
      {required final List<String> playlistNames,
      required final List<String> selectedList}) = _$_PlaylistState;

  @override
  List<String> get playlistNames;
  @override
  List<String> get selectedList;
  @override
  @JsonKey(ignore: true)
  _$$_PlaylistStateCopyWith<_$_PlaylistState> get copyWith =>
      throw _privateConstructorUsedError;
}
