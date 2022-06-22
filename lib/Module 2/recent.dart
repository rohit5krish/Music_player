import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/DB/data_model.dart';
import 'package:music_player/Module%201/home_page.dart';
import 'package:music_player/Module%202/play_song.dart';
import 'package:music_player/Widgets/home_widgets.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

List<audioModel> recentdbsongs = [];
List<Audio> finalrecent = [];
const String recent = 'recent';

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

addRecDB() async {
  // recentdbsongs = dbBox.get('recent')!.cast<audioModel>();
  recentdbsongs.clear();
  for (var element in finalrecent) {
    recentdbsongs.add(audioModel(
        id: int.parse(element.metas.id.toString()),
        songname: element.metas.title.toString(),
        artist: element.metas.artist.toString(),
        songuri: element.path));
  }
  await dbBox.put(recent, recentdbsongs);
}

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  void initState() {
    super.initState();
    recentdbsongs = dbBox.get(recent)!.cast<audioModel>();
    getRecsongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  recentdbsongs.clear();
                  getRecsongs();
                });
                dbBox.put(recent, recentdbsongs);
              },
              icon: const Icon(Icons.delete))
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Recent'),
        centerTitle: true,
        toolbarHeight: 65,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
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
                  return InkWell(
                    onTap: () {
                      playSong().playinglist(
                          finalrecent, (finalrecent.length - index) - 1);
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
                    ),
                  );
                }),
      ),
    );
  }
}
