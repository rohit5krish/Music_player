import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/favorite/favourites.dart';
import 'package:music_player/splash.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';
part 'favorite_bloc.freezed.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteState.initial()) {
    on<GetFavSong>((event, emit) {
      List<Audio> blocFinalFav = [];
      List<audioModel> blocFavSong = [];
      blocFavSong = dbBox.get(favsongs)!.cast<audioModel>();
      for (var element in blocFavSong) {
        blocFinalFav.add(Audio.file(element.songuri,
            metas: Metas(
                title: element.songname,
                artist: element.artist,
                id: element.id.toString())));
      }
      emit(state.copyWith(
          favSongList: blocFavSong, finalFavSongs: blocFinalFav));
    });

    on<AddFavToDb>((event, emit) {
      List<audioModel> favAddList = [];
      favAddList = dbBox.get(favsongs)!.cast<audioModel>();
      favAddList.add(event.songData);
      dbBox.put(favsongs, favAddList);
      emit(state.copyWith(favSongList: favAddList));
    });

    on<DeleteFavSong>((event, emit) {
      List<audioModel> _favSongs = [];
      _favSongs = dbBox.get(favsongs)!.cast<audioModel>();
      _favSongs.removeAt(event.index);
      dbBox.put(favsongs, _favSongs);
      emit(state.copyWith(favSongList: _favSongs));
    });
  }
}
