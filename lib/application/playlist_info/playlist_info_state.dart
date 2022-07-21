part of 'playlist_info_bloc.dart';

@freezed
class PlaylistInfoState with _$PlaylistInfoState {
  const factory PlaylistInfoState({
    required List<audioModel> playlistSongs,
    required List<Audio> finalPlaylistSongs,
  }) = _PlaylistInfoState;

  factory PlaylistInfoState.initial() {
    return const PlaylistInfoState(playlistSongs: [], finalPlaylistSongs: []);
  }
}
