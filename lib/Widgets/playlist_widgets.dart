// ignore_for_file: prefer_is_empty, camel_case_types

import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/DB/data_model.dart';
import 'package:music_player/Module%204/playlist.dart';
import 'package:music_player/Module%205/playlist_info.dart';
import 'package:music_player/Widgets/home_widgets.dart';
import 'package:music_player/splash.dart';

class playlistalbums extends StatefulWidget {
  final String name;
  final int index;
  final ValueChanged<bool> isSelected;
  const playlistalbums(
      {Key? key,
      required this.name,
      required this.index,
      required this.isSelected})
      : super(key: key);

  @override
  State<playlistalbums> createState() => _playlistalbumsState();
}

List<String> selectedlist = [];

class _playlistalbumsState extends State<playlistalbums> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    plylstsongs.value = dbBox.get(widget.name)!.cast<audioModel>();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (selectedlist.length >= 1) {
          setState(() {
            isSelected = !isSelected;
            widget.isSelected(isSelected);
          });
        } else {
          clicked(context, widget.index, widget.name);
        }
      },
      onLongPress: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Column(
        children: [
          SizedBox(
            height: 130,
            width: 130,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.blue,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: isSelected && selectedlist.length >= 1
                            ? Icon(
                                Icons.check_box_outlined,
                                color: white,
                              )
                            : Container(),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.music_note,
                          color: white,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
          const SizedBox(
            height: 9,
          ),
          Text(
            widget.name,
            style: whitetxt18,
          ),
          Text(
            'Total ${plylstsongs.value.length} Songs',
            style: white54txt14,
          )
        ],
      ),
    );
  }

  clicked(context, index, name) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return PlaylistInfo(boxkey: name);
    }));
  }
}

selectPlaylist(BuildContext context, audioModel element) {
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
                Text('Select a Playlist',
                    style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: plylst.value.isEmpty
                        ? Center(
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
                                  plylstsongs.value = dbBox
                                      .get(plylst.value[index])!
                                      .cast<audioModel>();
                                  !checkAdded(
                                          element.songname, plylstsongs.value)
                                      ? addSongPlylst(context, index, element)
                                      : addedNoti(
                                          isadd: true,
                                          ctx: context,
                                          isfav: plylst.value[index]);
                                  Navigator.of(context).pop();
                                },
                                child: ListTile(
                                  title: Text(
                                    plylst.value[index],
                                    style: TextStyle(color: white),
                                  ),
                                  trailing: checkAdded(element.songname,
                                          dbBox.get(plylst.value[index])!)
                                      ? Text(
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
                      showBottom(
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

Future addSongPlylst(
    BuildContext context, int index, audioModel element) async {
  plylstsongs.value = List.from(plylstsongs.value)..add(element);
  plylstsongs.notifyListeners();
  await dbBox.put(plylst.value[index], plylstsongs.value);
  addedNoti(isadd: false, ctx: context, isfav: plylst.value[index]);
}
