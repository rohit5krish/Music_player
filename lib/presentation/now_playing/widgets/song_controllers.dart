import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/now_playing/now_playing.dart';

class SongControllerWidget extends StatelessWidget {
  final RealtimePlayingInfos realtimePlayingInfos;
  SongControllerWidget({
    Key? key,
    required this.realtimePlayingInfos,
  }) : super(key: key);

  bool songSkip = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        realtimePlayingInfos.current!.audio.audio !=
                audioPlayer.playlist!.audios[0]
            ? IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () async {
                  if (songSkip) {
                    songSkip = false;
                    await audioPlayer.previous();
                    songSkip = true;
                  }
                },
                icon: const Icon(Icons.skip_previous_rounded,
                    color: white, size: 60))
            : IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(
                  Icons.skip_previous_rounded,
                  color: Colors.grey.withOpacity(0.5),
                  size: 60,
                )),
        IconButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              realtimePlayingInfos.isPlaying
                  ? audioPlayer.pause()
                  : audioPlayer.play();
            },
            icon: Icon(
                realtimePlayingInfos.isPlaying
                    ? Icons.pause_circle
                    : Icons.play_circle_fill_rounded,
                color: white,
                size: 60)),
        realtimePlayingInfos.current!.audio.audio !=
                audioPlayer
                    .playlist!.audios[(audioPlayer.playlist!.audios.length) - 1]
            ? IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () async {
                  if (songSkip) {
                    songSkip = false;
                    await audioPlayer.next();
                    songSkip = true;
                  }
                },
                icon:
                    const Icon(Icons.skip_next_rounded, color: white, size: 60))
            : IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () {},
                icon: Icon(Icons.skip_next_rounded,
                    color: Colors.grey.withOpacity(0.5), size: 60)),
      ],
    );
  }
}
