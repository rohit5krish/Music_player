import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/playlist/playlist_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/playlist/widgets/create_playlist.dart';
import 'package:music_player/presentation/playlist/widgets/playlist_album.dart';
import 'package:music_player/splash.dart';

class musicPlaylist extends StatefulWidget {
  const musicPlaylist({Key? key}) : super(key: key);

  @override
  State<musicPlaylist> createState() => _musicPlaylistState();
}

TextEditingController playlistctrl = TextEditingController();
ValueNotifier<List<String>> plylst = ValueNotifier([]);

// getFromDb() {
//   plylst.value = dbBox.get(plylstlisting)!.cast<String>();
// }

class _musicPlaylistState extends State<musicPlaylist> {
  // @override
  // void initState() {
  //   super.initState();
  //   getFromDb();
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<PlaylistBloc>(context).add(GetPlaylistNames());
    });
    return WillPopScope(
      onWillPop: () async {
        if (selectedlist.length >= 1) {
          setState(() {
            selectedlist.clear();
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          //AppBar With add Playlist button
          appBar: AppBar(
            title: Text(selectedlist.length >= 1
                ? '${selectedlist.length} Selected'
                : 'Playlists'),
            centerTitle: true,
            toolbarHeight: 65,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: selectedlist.length >= 1
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        selectedlist.clear();
                      });
                    },
                    icon: const Icon(Icons.close))
                : IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded)),
            actions: [
              selectedlist.length >= 1
                  ? IconButton(
                      onPressed: () {
                        gridDeletion();
                      },
                      icon: const Icon(Icons.delete))
                  : IconButton(
                      onPressed: () {
                        createPlaylist(context: context, addply: false);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 28,
                      )),
              const SizedBox(
                width: 7,
              )
            ],
          ),
          backgroundColor: bodyclr,
          body: BlocBuilder<PlaylistBloc, PlaylistState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(0),
                child: state.playlistNames.isEmpty
                    ? const Center(
                        child: Text(
                          'No Playlists',
                          style: whitetxt22,
                        ),
                      )
                    : GridView.builder(
                        padding:
                            const EdgeInsets.only(top: 30, left: 10, right: 10),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 40),
                        itemCount: state.playlistNames.length,
                        itemBuilder: (context, index) {
                          // List<audioModel> songsInPly = dbBox
                          //     .get(state.playlistNames[index])!
                          //     .cast<audioModel>();
                          // int totalNo = songsInPly.length;
                          return PlaylistAlbums(
                            name: state.playlistNames[index],
                            index: index,
                            // totalSongs: totalNo,
                            isSelected: (bool value) {
                              setState(() {
                                if (value) {
                                  selectedlist.add(state.playlistNames[index]);
                                } else {
                                  selectedlist
                                      .remove(state.playlistNames[index]);
                                }
                              });
                            },
                          );
                        }),
              );
            },
          )),
    );
  }

  gridDeletion() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Delete Playlist?'),
            content: const Text(
                'Are You Sure To Want to Delete the Selected Playlists?'),
            actions: [
              TextButton(
                  onPressed: () async {
                    // for (int i = 0; i < selectedlist.length; i++) {
                    //   plylst.value.remove(selectedlist[i]);
                    //   dbBox.delete(selectedlist[i]);
                    //   await dbBox.put(plylstlisting, plylst.value);
                    // }
                    // plylst.notifyListeners();
                    setState(() {
                      selectedlist.clear();
                    });
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
}
