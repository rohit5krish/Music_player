import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/favorite/widgets/add_favorites.dart';
import 'package:music_player/domain/play_song.dart';
import 'package:music_player/presentation/favorite/widgets/favorites_list.dart';

ValueNotifier<List<audioModel>> favsonglist = ValueNotifier([]);
const String favsongs = 'favsongs';
ValueNotifier<List<Audio>> finalfavsongs = ValueNotifier([]);

class Favourites extends StatefulWidget {
  const Favourites({Key? key}) : super(key: key);

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  void initState() {
    super.initState();
    getFavSongs();
  }

  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
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
        body: ValueListenableBuilder(
          valueListenable: finalfavsongs,
          builder:
              (BuildContext context, List<Audio> finalfavsongs, Widget? child) {
            return Padding(
                padding: const EdgeInsets.all(15),
                child: finalfavsongs.isEmpty
                    ? const Center(
                        child: Text(
                          'No Favourite Songs',
                          style: whitetxt22,
                        ),
                      )
                    : ListView.builder(
                        itemCount: finalfavsongs.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              playSong().playinglist(finalfavsongs, index);
                              BlocProvider.of<HomeBloc>(context)
                                  .add(const HomeEvent.songPlayed());
                            },
                            child: favList(
                              favSongData: finalfavsongs[index],
                              index: index,
                            ),
                          );
                        }));
          },
        ));
  }
}

getFavSongs() {
  finalfavsongs.value.clear();
  for (var element in favsonglist.value) {
    finalfavsongs.value.add(Audio.file(element.songuri,
        metas: Metas(
            title: element.songname,
            artist: element.artist,
            id: element.id.toString())));
  }
  finalfavsongs.notifyListeners();
}
