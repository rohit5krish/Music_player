part of 'playlist_bloc.dart';

@freezed
class PlaylistState with _$PlaylistState {
  const factory PlaylistState({
    required List<String> playlistNames,
  }) = _PlaylistState;

  factory PlaylistState.initial() {
    return PlaylistState(playlistNames: []);
  }
}
