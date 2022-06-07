import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/DB/data_model.dart';
import 'package:music_player/Widgets/home_widgets.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

List<audioModel> recentdbsongs = [];
List<Audio> finalrecent = [];

getRecsongs() {
  finalrecent.clear();
  for (var element in recentdbsongs) {
    finalrecent.add(Audio.file(element.songuri,
        metas: Metas(
            title: element.songname,
            artist: element.artist,
            id: element.id.toString())));
  }
}

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecsongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Recent'),
        centerTitle: true,
        toolbarHeight: 65,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      backgroundColor: bodyclr,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: finalrecent.isEmpty
            ? Center(
                child: Text(
                  'No Recent Songs',
                  style: whitetxt18,
                ),
              )
            : ListView.builder(
                itemCount: finalrecent.length,
                itemBuilder: (context, index) {
                  return Songs(
                    img: QueryArtworkWidget(
                        nullArtworkWidget: Icon(
                          Icons.music_note,
                          color: white,
                          size: 30,
                        ),
                        id: int.parse(
                            finalrecent[(finalrecent.length - index) - 1]
                                .metas
                                .id
                                .toString()),
                        type: ArtworkType.AUDIO),
                    songname: finalrecent[(finalrecent.length - index) - 1]
                        .metas
                        .title
                        .toString(),
                    artist: finalrecent[(finalrecent.length - index) - 1]
                                .metas
                                .artist
                                .toString() ==
                            '<unknown>'
                        ? "Unknown Artist"
                        : finalrecent[(finalrecent.length - index) - 1]
                            .metas
                            .artist
                            .toString(),
                    index: (finalrecent.length - index) - 1,
                  );
                }),
      ),
    );
  }
}
