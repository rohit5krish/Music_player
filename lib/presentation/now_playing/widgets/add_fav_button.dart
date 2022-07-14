import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/favorite/favorite_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';
import 'package:music_player/presentation/now_playing/now_playing.dart';
import 'package:music_player/splash.dart';

class AddFavButtonWidget extends StatelessWidget {
  AddFavButtonWidget({
    Key? key,
  }) : super(key: key);

  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        BlocProvider.of<FavoriteBloc>(context).add(FavStateChange(
            isFavorite: checkAdded(
                audioPlayer.getCurrentAudioTitle, state.favSongList)));
        return IconButton(
            onPressed: () async {
              checkAdded(audioPlayer.getCurrentAudioTitle, state.favSongList)
                  ? removeFav(state.favSongList)
                  : addFav();
              BlocProvider.of<FavoriteBloc>(context)
                  .add(FavStateChange(isFavorite: !state.isFav!));
            },
            icon: state.isFav ??
                    checkAdded(
                        audioPlayer.getCurrentAudioTitle, state.favSongList)
                ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                    size: 30,
                  )
                : const Icon(
                    Icons.favorite_outline_rounded,
                    color: white,
                    size: 30,
                  ));
      },
    );
  }

  // Remove Song from Favorites
  removeFav(List<audioModel> favSongsDatas) async {
    late int index;

    for (var element in favSongsDatas) {
      if (audioPlayer.getCurrentAudioTitle == element.songname) {
        index = favSongsDatas.indexOf(element);
        break;
      }
    }
    BlocProvider.of<FavoriteBloc>(ctx).add(DeleteFavSong(index: index));
  }

// Add to Favorites
  addFav() async {
    late int index;
    for (var element in dbsongs) {
      if (audioPlayer.getCurrentAudioTitle == element.songname) {
        index = dbsongs.indexOf(element);
        break;
      }
    }
    BlocProvider.of<FavoriteBloc>(ctx)
        .add(AddFavToDb(songData: dbsongs[index]));
  }
}
