import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/core/constants.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongImageWidget extends StatelessWidget {
  final RealtimePlayingInfos realtimePlayingInfos;
  const SongImageWidget({
    Key? key,
    required this.realtimePlayingInfos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: QueryArtworkWidget(
            keepOldArtwork: true,
            nullArtworkWidget: const SizedBox(
              width: 300,
              height: 300,
              child: Icon(
                Icons.music_note,
                color: white,
                size: 150,
              ),
            ),
            artworkHeight: 300,
            artworkWidth: 300,
            id: int.parse(realtimePlayingInfos.current!.audio.audio.metas.id!),
            type: ArtworkType.AUDIO));
  }
}
