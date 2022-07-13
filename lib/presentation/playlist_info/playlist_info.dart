import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/domain/play_song.dart';
import 'package:music_player/presentation/playlist/playlist.dart';
import 'package:music_player/presentation/playlist_info/widgets/add_song_playlist.dart';
import 'package:music_player/presentation/playlist_info/widgets/delete_playlist.dart';
import 'package:music_player/presentation/playlist_info/widgets/play_button_widget.dart';
import 'package:music_player/presentation/playlist_info/widgets/songs_list.dart';
import 'package:music_player/splash.dart';

ValueNotifier<List<audioModel>> plylstsongs = ValueNotifier([]);
ValueNotifier<List<Audio>> finalplylstsongs = ValueNotifier([]);

class PlaylistInfo extends StatefulWidget {
  PlaylistInfo({Key? key, required this.boxkey}) : super(key: key);
  String boxkey;

  @override
  State<PlaylistInfo> createState() => _PlaylistInfoState();
}

getSongs() {
  finalplylstsongs.value.clear();
  for (var element in plylstsongs.value) {
    finalplylstsongs.value.add(Audio.file(element.songuri,
        metas: Metas(
            title: element.songname,
            artist: element.artist,
            id: element.id.toString())));
  }
  finalplylstsongs.notifyListeners();
}

class _PlaylistInfoState extends State<PlaylistInfo> {
  TextEditingController _editctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    plylstsongs.value = dbBox.get(widget.boxkey)!.cast<audioModel>();
    getSongs();
  }

// Add Songs into Database

  @override
  Widget build(BuildContext context) {
    List<String> plylstpoptop = ['Delete Playlist', 'Edit Playlist'];
    _editctrl.text = widget.boxkey;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [bggradient1, cardshomecolor, cardshomecolor])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          actions: [
            PopupMenuButton(
              icon: const Icon(Icons.more_vert, color: Colors.grey),
              itemBuilder: (context) {
                return [
                  ...plylstpoptop.map((String value) {
                    return PopupMenuItem(value: value, child: Text(value));
                  }).toList()
                ];
              },
              onSelected: popselection,
            )
          ],
        ),
        body: Column(
          children: [
            // Top Section
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                // Song Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: const Icon(
                    Icons.music_note,
                    color: white,
                    size: 50,
                  ),
                ),
                const SizedBox(height: 10),
                // Song Name
                Text(
                  widget.boxkey,
                  style: whitetxt18,
                ),
                const SizedBox(
                  height: 25,
                ),
                // Two Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const PlayButtonWidget(),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue[800])),
                        onPressed: () {
                          addsongplaylist(context, widget.boxkey);
                        },
                        child: const Text('Add Song'))
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            // Songs List
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: finalplylstsongs,
                builder: (BuildContext context, List<Audio> finalplylstsongs,
                    Widget? child) {
                  return ListView.builder(
                      itemCount: finalplylstsongs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            playSong().playinglist(finalplylstsongs, index);

                            BlocProvider.of<HomeBloc>(context)
                                .add(const HomeEvent.songPlayed());
                          },
                          child: plylistsngs(
                            index: index,
                            plylistSongData: finalplylstsongs[index],
                            boxkey: widget.boxkey,
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  popselection(String value) async {
    if (value == 'Delete Playlist') {
      deleteplaylist(context, widget.boxkey);
    } else if (value == 'Edit Playlist') {
      editPlaylist();
    }
  }

  void editPlaylist() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Edit Playlist'),
            content: TextFormField(
              controller: _editctrl,
              decoration: const InputDecoration(hintText: 'Playlist Name'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () async {
                    // Edit all Playlist List
                    int index = plylst.value.indexOf(widget.boxkey);
                    plylst.value
                        .replaceRange(index, index + 1, [_editctrl.text]);
                    plylst.notifyListeners();
                    await dbBox.put(plylstlisting, plylst.value);

                    // Edit Playlistinfo key
                    await dbBox.put(_editctrl.text, plylstsongs.value);
                    dbBox.delete(widget.boxkey);
                    setState(() {
                      widget.boxkey = _editctrl.text;
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Update'))
            ],
          );
        });
  }
}
