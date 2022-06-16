// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/Module%203/favourites.dart';
import 'package:music_player/Widgets/playlist_widgets.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

class favList extends StatelessWidget {
  final int index;
  final int id;
  final String songname;
  final String artist;
  favList(
      {required this.index,
      required this.id,
      required this.songname,
      required this.artist});

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
              nullArtworkWidget: Icon(Icons.music_note, color: white, size: 30),
              id: id,
              type: ArtworkType.AUDIO),
        ),
        title: SizedBox(
          width: 300,
          child: Text(
            songname,
            style: whitetxt18,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: SizedBox(
          width: 300,
          child: Text(
            artist,
            style: white30txt12,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: PopupMenuButton(
            onSelected: favpopselection,
            icon: Icon(Icons.more_vert, color: Colors.grey),
            itemBuilder: (context) {
              return [
                ...favpoplist.map((value) {
                  return PopupMenuItem(value: value, child: Text(value));
                }).toList()
              ];
            }));
  }

  favpopselection(value) async {
    if (value == removfav) {
      favsonglist.value.removeAt(index);
      favsonglist.notifyListeners();
      getFavSongs();
      await dbBox.put(favsongs, favsonglist.value);
    } else if (value == addplylist) {
      selectPlaylist(ctx, favsonglist.value[index]);
    }
  }
}
