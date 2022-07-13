import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/favorite/favorite_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/favorite/favourites.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';
import 'package:music_player/presentation/playlist_info/playlist_info.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

class plylistsngs extends StatefulWidget {
  final int index;
  final Audio plylistSongData;
  final String boxkey;

  plylistsngs(
      {required this.index,
      required this.plylistSongData,
      required this.boxkey});

  static const removsong = 'Remove from Playlist';
  static const addfav = 'Add to Favourites';

  @override
  State<plylistsngs> createState() => _plylistsngsState();
}

class _plylistsngsState extends State<plylistsngs> {
  final List<String> plylstpoplist = [
    plylistsngs.removsong,
    plylistsngs.addfav
  ];
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    final int num = widget.index + 1;
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
                      id: int.parse(widget.plylistSongData.metas.id.toString()),
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
                      widget.plylistSongData.metas.title.toString(),
                      style: whitetxt15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                      width: 200,
                      child: Text(
                        widget.plylistSongData.metas.artist == '<unknown>'
                            ? "Unknown Artist"
                            : widget.plylistSongData.metas.artist.toString(),
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
                    songDeletion();
                    deleteNoti(context);
                  } else if (value == plylistsngs.addfav) {
                    // ignore: avoid_single_cascade_in_expression_statements
                    checkAdded(widget.plylistSongData.metas.title.toString(),
                            state.favSongList)
                        ? addedNoti(isadd: true, ctx: ctx, isfav: 'Favourites')
                        : BlocProvider.of<FavoriteBloc>(context).add(AddFavToDb(
                            songData: plylstsongs.value[widget.index]));

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

  songDeletion() {
    plylstsongs.value.removeAt(widget.index);
    plylstsongs.notifyListeners();

    finalplylstsongs.value.removeAt(widget.index);
    finalplylstsongs.notifyListeners();

    dbBox.put(widget.boxkey, plylstsongs.value);
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
