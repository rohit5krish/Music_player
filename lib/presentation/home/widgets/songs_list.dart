// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/favorite/favorite_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/favorite/favourites.dart';
import 'package:music_player/presentation/playlist/widgets/add_playlist.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Songs extends StatelessWidget {
  final Audio songData;
  final int index;

  Songs({Key? key, required this.songData, required this.index})
      : super(key: key);

  static const String addplaylist = 'Add to Playlist';
  static const String addfavourite = 'Add to Favourites';
  final List<String> popuplist = [addplaylist, addfavourite];
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                    height: 50,
                    width: 50,
                    child: QueryArtworkWidget(
                        nullArtworkWidget: const Icon(
                          Icons.music_note,
                          color: white,
                          size: 30,
                        ),
                        id: int.parse(songData.metas.id.toString()),
                        type: ArtworkType.AUDIO)),
                const SizedBox(
                  width: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            songData.metas.title.toString(),
                            style: whitetxt15,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            songData.metas.artist.toString() == '<unknown>'
                                ? "Unknown Artist"
                                : songData.metas.artist.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: white30txt12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BlocBuilder<FavoriteBloc, FavoriteState>(
              builder: (context, state) {
                return PopupMenuButton(
                  icon: const Icon(Icons.more_vert, color: Colors.grey),
                  itemBuilder: (context) {
                    return [
                      ...popuplist.map((String value) {
                        return PopupMenuItem(
                            height: 35,
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 12),
                            ));
                      }).toList()
                    ];
                  },
                  padding: const EdgeInsets.all(5),
                  onSelected: (value) {
                    if (value == addplaylist) {
                      addToPlaylist(ctx, dbsongs[index]);
                    } else if (value == addfavourite) {
                      checkAdded(songData.metas.title.toString(),
                              state.favSongList)
                          ? addedNoti(
                              isadd: true, ctx: ctx, isfav: 'Favourites')
                          : BlocProvider.of<FavoriteBloc>(ctx)
                              .add(AddFavToDb(songData: dbsongs[index]));

                      //  SnackBar
                      addedNoti(isadd: false, ctx: ctx, isfav: 'Favourites');
                    }
                  },
                );
              },
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

addedNoti(
    {required bool isadd, required BuildContext ctx, required String isfav}) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      backgroundColor: bggradient1,
      duration: const Duration(seconds: 4),
      content:
          isadd ? Text('Already Added to $isfav') : Text('Added to $isfav')));
}

bool checkAdded(String songname, List songslist) {
  bool check = false;
  for (var element in songslist) {
    if (songname == element.songname) {
      check = true;
      break;
    }
  }
  if (check) {
    return true;
  } else {
    return false;
  }
}
