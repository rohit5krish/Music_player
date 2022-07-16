import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/favorite/favorite_bloc.dart';
import 'package:music_player/application/playlist_info/playlist_info_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/favorite/favourites.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';
import 'package:music_player/presentation/playlist_info/playlist_info.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

class plylistsngs extends StatelessWidget {
  final int index;
  final audioModel plylistSongData;
  final String boxkey;

  plylistsngs({
    Key? key,
    required this.index,
    required this.plylistSongData,
    required this.boxkey,
  }) : super(key: key);

  static const removsong = 'Remove from Playlist';
  static const addfav = 'Add to Favourites';
  final List<String> plylstpoplist = [removsong, addfav];
  late BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    final int num = index + 1;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '$num',
                style: white54txt14,
              ),
              const SizedBox(
                width: 15,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: QueryArtworkWidget(
                      nullArtworkWidget:
                          const Icon(Icons.music_note, color: white, size: 30),
                      id: plylistSongData.id,
                      type: ArtworkType.AUDIO)),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      plylistSongData.songname,
                      style: whitetxt15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                      width: 200,
                      child: Text(
                        plylistSongData.artist == '<unknown>'
                            ? "Unknown Artist"
                            : plylistSongData.artist,
                        style: white54txt14,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            ],
          ),
          BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              return PopupMenuButton(
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                itemBuilder: (context) {
                  return [
                    ...plylstpoplist.map((String value) {
                      return PopupMenuItem(value: value, child: Text(value));
                    }).toList()
                  ];
                },
                onSelected: (value) {
                  if (value == plylistsngs.removsong) {
                    BlocProvider.of<PlaylistInfoBloc>(context)
                        .add(DeletePlySong(boxKey: boxkey, index: index));
                    BlocProvider.of<PlaylistInfoBloc>(context)
                        .add(GetPlaylistSongs(boxKey: boxkey));

                    deleteNoti(context);
                  } else if (value == plylistsngs.addfav) {
                    // ignore: avoid_single_cascade_in_expression_statements
                    checkAdded(plylistSongData.songname, state.favSongList)
                        ? addedNoti(isadd: true, ctx: ctx, isfav: 'Favourites')
                        : BlocProvider.of<FavoriteBloc>(context)
                            .add(AddFavToDb(songData: plylistSongData));

                    //  SnackBar
                    addedNoti(isadd: false, ctx: ctx, isfav: 'Favourites');
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }

  deleteNoti(BuildContext ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        backgroundColor: bggradient1,
        duration: const Duration(seconds: 4),
        content: const Text('Song removed from Playlist')));
  }

  // plylistpopselection(String value) async {

  // }
}
