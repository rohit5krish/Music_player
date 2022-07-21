part of 'playlist_bloc.dart';

@freezed
class PlaylistState with _$PlaylistState {
  const factory PlaylistState({
    required List<String> playlistNames,
    required List<String> selectedList,
  }) = _PlaylistState;

  factory PlaylistState.initial() {
    return PlaylistState(
        playlistNames: dbBox.get(plylstlisting)!.cast<String>(),
        selectedList: []);
  }
}
