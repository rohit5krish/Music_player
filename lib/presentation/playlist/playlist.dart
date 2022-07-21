import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/playlist/playlist_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/playlist/widgets/create_playlist.dart';
import 'package:music_player/presentation/playlist/widgets/playlist_album.dart';
import 'package:music_player/presentation/playlist_info/playlist_info.dart';
import 'package:music_player/presentation/playlist_info/widgets/delete_playlist.dart';
import 'package:music_player/splash.dart';

TextEditingController playlistctrl = TextEditingController();

class musicPlaylist extends StatelessWidget {
  musicPlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistBloc, PlaylistState>(
      builder: (context, state) {
        return WillPopScope(
            onWillPop: () async {
              if (state.selectedList.isNotEmpty) {
                BlocProvider.of<PlaylistBloc>(context).add(const UnselectAll());
                return false;
              } else {
                return true;
              }
            },
            child: Scaffold(
                //AppBar With add Playlist button
                appBar: AppBar(
                  title: Text(state.selectedList.isNotEmpty
                      ? '${state.selectedList.length} Selected'
                      : 'Playlists'),
                  centerTitle: true,
                  toolbarHeight: 65,
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  leading: state.selectedList.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            BlocProvider.of<PlaylistBloc>(context)
                                .add(const UnselectAll());
                          },
                          icon: const Icon(Icons.close))
                      : IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                  actions: [
                    state.selectedList.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              deleteplaylist(
                                  context: context,
                                  isMultiDelete: true,
                                  selectedPlylsts: state.selectedList);
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
                body: state.playlistNames.isEmpty
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
                          List<audioModel> songsInPly = dbBox
                              .get(state.playlistNames[index])!
                              .cast<audioModel>();
                          int totalSongs = songsInPly.length;
                          final playlist = state.playlistNames[index];
                          bool isPlylstSelected =
                              state.selectedList.contains(playlist);
                          return InkWell(
                            onTap: () {
                              if (state.selectedList.isNotEmpty) {
                                BlocProvider.of<PlaylistBloc>(context).add(
                                    MultiSelection(selectedPlaylist: playlist));
                              } else {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return PlaylistInfo(
                                    boxkey: playlist,
                                    idx: index,
                                  );
                                }));
                              }
                            },
                            onLongPress: () {
                              BlocProvider.of<PlaylistBloc>(context).add(
                                  MultiSelection(selectedPlaylist: playlist));
                            },
                            child: PlaylistAlbums(
                              name: playlist,
                              index: index,
                              isSelected: isPlylstSelected,
                              totalNo: totalSongs,
                            ),
                          );
                        })));
      },
    );
  }
}
