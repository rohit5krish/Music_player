part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    required List<audioModel> favSongList,
    required List<Audio> finalFavSongs,
  }) = _FavoriteState;

  factory FavoriteState.initial() {
    // List<Audio> blocFinalFav = [];
    // List<audioModel> blocFavSong = [];
    // blocFavSong = dbBox.get(favsongs)!.cast<audioModel>();
    // for (var element in blocFavSong) {
    //   blocFinalFav.add(Audio.file(element.songuri,
    //       metas: Metas(
    //           title: element.songname,
    //           artist: element.artist,
    //           id: element.id.toString())));
    // }
    return FavoriteState(favSongList: [], finalFavSongs: []);
  }
}
