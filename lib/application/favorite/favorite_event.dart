part of 'favorite_bloc.dart';

@freezed
class FavoriteEvent with _$FavoriteEvent {
  const factory FavoriteEvent.getFavSong() = GetFavSong;
  const factory FavoriteEvent.addFavToDb({
    required audioModel songData,
  }) = AddFavToDb;
  const factory FavoriteEvent.deleteFavSong({
    required int index,
  }) = DeleteFavSong;

  // For Now playing screen
  const factory FavoriteEvent.favStateChange({required bool isFavorite}) =
      FavStateChange;
}
