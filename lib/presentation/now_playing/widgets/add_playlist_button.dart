import 'package:flutter/material.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/now_playing/now_playing.dart';
import 'package:music_player/presentation/playlist/widgets/add_playlist.dart';
import 'package:music_player/splash.dart';

class AddPlaylistButtonWidget extends StatelessWidget {
  const AddPlaylistButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: const EdgeInsets.all(0),
        onPressed: () {
          int index;
          for (var element in dbsongs) {
            if (audioPlayer.getCurrentAudioTitle == element.songname) {
              index = dbsongs.indexOf(element);
              addToPlaylist(context, dbsongs[index]);
              break;
            }
          }
        },
        icon: const Icon(
          Icons.playlist_play_rounded,
          color: white,
          size: 40,
        ));
  }
}
