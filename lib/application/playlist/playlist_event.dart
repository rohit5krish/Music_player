part of 'playlist_bloc.dart';

@freezed
class PlaylistEvent with _$PlaylistEvent {
  const factory PlaylistEvent.getPlaylistNames() = GetPlaylistNames;
  const factory PlaylistEvent.createBlocPlaylist({
    required String newPlylstName,
  }) = CreateBlocPlaylist;
}
