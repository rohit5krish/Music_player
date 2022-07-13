import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/favorite/favorite_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/playlist/widgets/add_playlist.dart';
import 'package:on_audio_query/on_audio_query.dart';

class favList extends StatelessWidget {
  final Audio favSongData;
  final int index;
  favList({
    Key? key,
    required this.favSongData,
    required this.index,
  }) : super(key: key);

  static const removfav = 'Remove from Favourites';
  static const addplylist = 'Add to Playlist';

  final List<String> favpoplist = [removfav, addplylist];
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: QueryArtworkWidget(
              nullArtworkWidget:
                  const Icon(Icons.music_note, color: white, size: 30),
              id: int.parse(favSongData.metas.id.toString()),
              type: ArtworkType.AUDIO),
        ),
        title: SizedBox(
          width: 300,
          child: Text(
            favSongData.metas.title.toString(),
            style: whitetxt18,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: SizedBox(
          width: 300,
          child: Text(
            favSongData.metas.artist == '<unknown>'
                ? "Unknown Artist"
                : favSongData.metas.artist.toString(),
            style: white30txt12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            return PopupMenuButton(
                onSelected: (value) {
                  if (value == removfav) {
                    BlocProvider.of<FavoriteBloc>(ctx)
                        .add(DeleteFavSong(index: index));
                    BlocProvider.of<FavoriteBloc>(ctx).add(const GetFavSong());
                  } else if (value == addplylist) {
                    addToPlaylist(ctx, state.favSongList[index]);
                  }
                },
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                itemBuilder: (context) {
                  return [
                    ...favpoplist.map((value) {
                      return PopupMenuItem(value: value, child: Text(value));
                    }).toList()
                  ];
                });
          },
        ));
  }
}
