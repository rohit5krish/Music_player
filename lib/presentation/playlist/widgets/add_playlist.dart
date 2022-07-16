import 'package:flutter/material.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';
import 'package:music_player/presentation/playlist/playlist.dart';
import 'package:music_player/presentation/playlist/widgets/create_playlist.dart';
import 'package:music_player/presentation/playlist_info/playlist_info.dart';
import 'package:music_player/splash.dart';

addToPlaylist(BuildContext context, audioModel element) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              color: bggradient1,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(50))),
          width: double.infinity,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Select a Playlist',
                    style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: plylst.value.isEmpty
                        ? const Center(
                            child: Text(
                              'No Playlists',
                              style: TextStyle(color: white),
                            ),
                          )
                        : ListView.builder(
                            itemCount: plylst.value.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // plylstsongs.value = dbBox
                                  //     .get(plylst.value[index])!
                                  //     .cast<audioModel>();
                                  // !checkAdded(
                                  //         element.songname, plylstsongs.value)
                                  //     ? addPlylstDb(context, index, element)
                                  //     :
                                  addedNoti(
                                      isadd: true,
                                      ctx: context,
                                      isfav: plylst.value[index]);
                                  Navigator.of(context).pop();
                                },
                                child: ListTile(
                                  title: Text(
                                    plylst.value[index],
                                    style: const TextStyle(color: white),
                                  ),
                                  trailing: checkAdded(element.songname,
                                          dbBox.get(plylst.value[index])!)
                                      ? const Text(
                                          'Already added',
                                          style: white30txt12,
                                        )
                                      : const Text(''),
                                ),
                              );
                            })),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      createPlaylist(
                          context: context, addply: true, element: element);
                    },
                    child: const Text('New Playlist'),
                    style: ElevatedButton.styleFrom(primary: Colors.purple))
              ],
            ),
          ),
        );
      });
}

Future addPlylstDb(BuildContext context, int index, audioModel element) async {
  // plylstsongs.value = List.from(plylstsongs.value)..add(element);
  // plylstsongs.notifyListeners();
  // await dbBox.put(plylst.value[index], plylstsongs.value);
  // addedNoti(isadd: false, ctx: context, isfav: plylst.value[index]);
}
