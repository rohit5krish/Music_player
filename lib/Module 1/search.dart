// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/Module%201/home_page.dart';
import 'package:music_player/Module%202/play_song.dart';
import 'package:music_player/Module%206/now_playing.dart';
import 'package:music_player/Widgets/home_widgets.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

class songSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    var result = query.isEmpty
        ? finalsonglist
        : finalsonglist
            .where((c) => c.metas.title!.toLowerCase().startsWith(query))
            .toList();
    return Container(
      color: bodyclr,
      child: result.isEmpty
          ? Center(
              child: Text(
                'No Results Found',
                style: TextStyle(color: white),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(15),
              child: ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        playSong().playinglist(result, index);
                        isVisible.value = true;
                        isVisible.notifyListeners();
                      },
                      child: Songs(
                        img: QueryArtworkWidget(
                            nullArtworkWidget: Icon(
                              Icons.music_note,
                              color: white,
                              size: 30,
                            ),
                            id: int.parse(result[index].metas.id.toString()),
                            type: ArtworkType.AUDIO),
                        songname: result[index].metas.title.toString(),
                        artist: result[index].metas.artist.toString(),
                        index: index,
                      ),
                    );
                  }),
            ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final result = finalsonglist
        .where(
            (c) => c.metas.title!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    return Container(
      padding: EdgeInsets.all(15),
      color: bodyclr,
      child: ListView.builder(
          itemCount: result.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                playSong().playinglist(finalsonglist, index);
                isVisible.value = true;
                isVisible.notifyListeners();
              },
              child: Songs(
                img: QueryArtworkWidget(
                    nullArtworkWidget: Icon(
                      Icons.music_note,
                      color: white,
                      size: 30,
                    ),
                    id: int.parse(result[index].metas.id.toString()),
                    type: ArtworkType.AUDIO),
                songname: result[index].metas.title.toString(),
                artist: result[index].metas.artist.toString(),
                index: index,
              ),
            );
          }),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(color: bggradient1),
        inputDecorationTheme:
            InputDecorationTheme(hintStyle: TextStyle(color: Colors.grey[400])),
        textTheme: TextTheme(headline6: TextStyle(color: white)));
  }
}
