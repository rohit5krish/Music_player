part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState(
      {required List<audioModel> favSongList,
      required List<Audio> finalFavSongs,

      // For Now playing Screen
      bool? isFav}) = _FavoriteState;

  factory FavoriteState.initial() {
    return const FavoriteState(favSongList: [], finalFavSongs: []);
  }
}
