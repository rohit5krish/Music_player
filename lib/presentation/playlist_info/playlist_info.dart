import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/application/playlist_info/playlist_info_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/play_song.dart';
import 'package:music_player/presentation/playlist/playlist.dart';
import 'package:music_player/presentation/playlist_info/widgets/add_song_button.dart';
import 'package:music_player/presentation/playlist_info/widgets/delete_playlist.dart';
import 'package:music_player/presentation/playlist_info/widgets/play_button_widget.dart';
import 'package:music_player/presentation/playlist_info/widgets/songs_list.dart';
import 'package:music_player/splash.dart';

class PlaylistInfo extends StatelessWidget {
  PlaylistInfo({Key? key, required this.boxkey}) : super(key: key);
  String boxkey;
  TextEditingController _editctrl = TextEditingController();
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<PlaylistInfoBloc>(context)
          .add(GetPlaylistSongs(boxKey: boxkey));
    });

    List<String> plylstpoptop = ['Delete Playlist', 'Edit Playlist'];
    _editctrl.text = boxkey;

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
                  boxkey,
                  style: whitetxt18,
                ),
                const SizedBox(
                  height: 25,
                ),
                // Two Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Play Button Refactored
                    const PlayButtonWidget(),

                    // Add Song Button Refactored
                    AddSongButtonWidget(boxkey: boxkey)
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            // Songs List
            Expanded(child: BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
              builder: (context, state) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.finalPlaylistSongs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          playSong()
                              .playinglist(state.finalPlaylistSongs, index);

                          BlocProvider.of<HomeBloc>(context)
                              .add(const HomeEvent.songPlayed());
                        },
                        child: plylistsngs(
                          index: index,
                          plylistSongData: state.playlistSongs[index],
                          boxkey: boxkey,
                        ),
                      );
                    });
              },
            ))
          ],
        ),
      ),
    );
  }

  popselection(String value) async {
    if (value == 'Delete Playlist') {
      deleteplaylist(ctx, boxkey);
    } else if (value == 'Edit Playlist') {
      editPlaylist();
    }
  }

  void editPlaylist() {
    showDialog(
        context: ctx,
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
                    int index = plylst.value.indexOf(boxkey);
                    plylst.value
                        .replaceRange(index, index + 1, [_editctrl.text]);
                    plylst.notifyListeners();
                    await dbBox.put(plylstlisting, plylst.value);

                    // Edit Playlistinfo key
                    // await dbBox.put(_editctrl.text, plylstsongs.value);
                    dbBox.delete(boxkey);
                    // setState(() {
                    boxkey = _editctrl.text;
                    // });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Update'))
            ],
          );
        });
  }
}
