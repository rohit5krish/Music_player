import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/favorite/favorite_bloc.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/favorite/widgets/add_favorites.dart';
import 'package:music_player/domain/play_song.dart';
import 'package:music_player/presentation/favorite/widgets/favorites_list.dart';

const String favsongs = 'favsongs';

class Favourites extends StatelessWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<FavoriteBloc>(context).add(const GetFavSong());
    });
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text('Favourites'),
          centerTitle: true,
          toolbarHeight: 65,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          actions: [
            IconButton(
                onPressed: () {
                  addsongfavourites(context);
                },
                icon: const Icon(
                  Icons.add_circle_outline_outlined,
                  size: 28,
                )),
            const SizedBox(
              width: 7,
            )
          ],
        ),
        backgroundColor: bodyclr,
        body: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            return Padding(
                padding: const EdgeInsets.all(15),
                child: state.finalFavSongs.isEmpty
                    ? const Center(
                        child: Text(
                          'No Favourite Songs',
                          style: whitetxt22,
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.finalFavSongs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              playSong()
                                  .playinglist(state.finalFavSongs, index);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(const HomeEvent.songPlayed());
                            },
                            child: favList(
                              favSongData: state.finalFavSongs[index],
                              index: index,
                            ),
                          );
                        }));
          },
        ));
  }
}
