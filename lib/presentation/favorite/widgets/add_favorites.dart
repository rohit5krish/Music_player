import 'package:flutter/material.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/favorite/favourites.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

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
                const Text('Select Songs to add',
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
                                  const Icon(Icons.music_note, color: white),
                              id: int.parse(dbsongs[index].id.toString()),
                              type: ArtworkType.AUDIO),
                          title: SizedBox(
                              width: 100,
                              child: Text(
                                dbsongs[index].songname,
                                style: const TextStyle(color: white),
                                overflow: TextOverflow.ellipsis,
                              )),
                          trailing: !checkAdded(
                                  dbsongs[index].songname, favsonglist.value)
                              ? IconButton(
                                  onPressed: () {
                                    addFavtoDb(context, index);
                                    getFavSongs();
                                  },
                                  icon:
                                      const Icon(Icons.add, color: Colors.grey))
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

addFavtoDb(BuildContext ctx, int index) async {
  favsonglist.value = List.from(favsonglist.value)..add(dbsongs[index]);
  await dbBox.put(favsongs, favsonglist.value);
  favsonglist.notifyListeners();
  addedNoti(isadd: false, ctx: ctx, isfav: 'Favourites');
}
