part of 'playlist_bloc.dart';

@freezed
class PlaylistEvent with _$PlaylistEvent {
  const factory PlaylistEvent.createPlylistNames({
    required String plylistName,
  }) = CreatePlylistNames;
  const factory PlaylistEvent.multiSelection({
    required String selectedPlaylist,
  }) = MultiSelection;
  const factory PlaylistEvent.unselectAll() = UnselectAll;
  const factory PlaylistEvent.editPlaylistName({
    required String oldPlaylistName,
    required String newPlaylistName,
    required List<audioModel> plylstAllSongs,
  }) = EditPlaylistName;
}
