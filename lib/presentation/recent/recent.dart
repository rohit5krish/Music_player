import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/domain/play_song.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';
import 'package:music_player/splash.dart';

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
            ? const Center(
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
                      BlocProvider.of<HomeBloc>(context)
                          .add(const HomeEvent.songPlayed());
                    },
                    child: Songs(songData: finalrecent[index], index: index),
                  );
                }),
      ),
    );
  }
}
