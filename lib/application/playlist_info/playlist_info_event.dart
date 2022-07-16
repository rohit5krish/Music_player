part of 'playlist_info_bloc.dart';

@freezed
class PlaylistInfoEvent with _$PlaylistInfoEvent {
  const factory PlaylistInfoEvent.getPlaylistSongs({
    required String boxKey,
  }) = GetPlaylistSongs;
  const factory PlaylistInfoEvent.addSongToPlaylist({
    required String boxKey,
    required audioModel songDatas,
  }) = AddSongToPlaylist;
  const factory PlaylistInfoEvent.deletePlySong({
    required String boxKey,
    required int index,
  }) = DeletePlySong;
}
