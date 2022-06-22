import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/DB/data_model.dart';
import 'package:music_player/Module%201/home_page.dart';
import 'package:music_player/Module%202/play_song.dart';
import 'package:music_player/Widgets/favourites_widgets.dart';
import 'package:music_player/Widgets/home_widgets.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

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
  addFavtoDb(int index) async {
    favsonglist.value = List.from(favsonglist.value)..add(dbsongs[index]);
    await dbBox.put(favsongs, favsonglist.value);
    favsonglist.notifyListeners();
    addedNoti(isadd: false, ctx: ctx, isfav: 'Favourites');
  }

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
                    ? Center(
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

                              isVisible.value = true;
                              isVisible.notifyListeners();
                            },
                            child: favList(
                              index: index,
                              artist: finalfavsongs[index].metas.artist ==
                                      '<unknown>'
                                  ? "Unknown Artist"
                                  : finalfavsongs[index]
                                      .metas
                                      .artist
                                      .toString(),
                              id: int.parse(
                                  finalfavsongs[index].metas.id.toString()),
                              songname:
                                  finalfavsongs[index].metas.title.toString(),
                            ),
                          );
                        }));
          },
        ));
  }

  void addsongfavourites(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: bggradient1,
                borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(50),
                    topRight: const Radius.circular(50))),
            width: double.infinity,
            height: 500,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Select Songs to add',
                      style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        itemCount: dbsongs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: QueryArtworkWidget(
                                nullArtworkWidget:
                                    Icon(Icons.music_note, color: white),
                                id: int.parse(dbsongs[index].id.toString()),
                                type: ArtworkType.AUDIO),
                            title: SizedBox(
                                width: 100,
                                child: Text(
                                  dbsongs[index].songname,
                                  style: TextStyle(color: white),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            trailing: !checkAdded(
                                    dbsongs[index].songname, favsonglist.value)
                                ? IconButton(
                                    onPressed: () {
                                      addFavtoDb(index);
                                      getFavSongs();
                                    },
                                    icon: const Icon(Icons.add,
                                        color: Colors.grey))
                                : const Text(''),
                          );
                        }),
                  )
                ],
              ),
            ),
          );
        });
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
