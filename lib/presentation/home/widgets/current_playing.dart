import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/now_playing/now_playing.dart';
import 'package:on_audio_query/on_audio_query.dart';

class crntplayinghom extends StatelessWidget {
  crntplayinghom({Key? key}) : super(key: key);

  bool songSkip = true;

  Widget audioImage(RealtimePlayingInfos realtimePlayingInfos) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: QueryArtworkWidget(
            keepOldArtwork: true,
            nullArtworkWidget: const Icon(
              Icons.music_note,
              color: white,
              size: 40,
            ),
            id: int.parse(realtimePlayingInfos.current!.audio.audio.metas.id!),
            type: ArtworkType.AUDIO));
  }

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
            width: screenwidth - 25,
            height: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: nowplayingbtm,
            ),
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: audioPlayer.builderRealtimePlayingInfos(
                builder: (context, realtimePlayingInfos) {
              if (realtimePlayingInfos != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const NowPlaying();
                              }));
                            },
                            child: Row(
                              children: [
                                // Song Image
                                audioImage(realtimePlayingInfos),

                                const SizedBox(
                                  width: 15,
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Song Name
                                    SizedBox(
                                        width: 120,
                                        height: 25,
                                        child: Marquee(
                                          text:
                                              audioPlayer.getCurrentAudioTitle,
                                          style: whitetxt15,
                                          scrollAxis: Axis.horizontal,
                                          blankSpace: 50,
                                          velocity: 30,
                                          pauseAfterRound:
                                              const Duration(seconds: 1),
                                          showFadingOnlyWhenScrolling: true,
                                          fadingEdgeStartFraction: 0.1,
                                          fadingEdgeEndFraction: 0.1,
                                          startPadding: 10,
                                          accelerationDuration:
                                              const Duration(seconds: 1),
                                          accelerationCurve: Curves.linear,
                                          decelerationDuration:
                                              const Duration(milliseconds: 500),
                                          decelerationCurve: Curves.easeOut,
                                        )),
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        audioPlayer.getCurrentAudioArtist,
                                        style: white30txt12,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0, right: 0),
                          child: Row(
                            children: [
                              realtimePlayingInfos.current!.audio.audio !=
                                      audioPlayer.playlist!.audios[0]
                                  ? IconButton(
                                      constraints: const BoxConstraints(),
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
                                      onPressed: () async {
                                        if (songSkip) {
                                          songSkip = false;
                                          await audioPlayer.previous();
                                          songSkip = true;
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.skip_previous_rounded,
                                        color: white,
                                        size: 50,
                                      ))
                                  : IconButton(
                                      constraints: const BoxConstraints(),
                                      padding:
                                          const EdgeInsets.only(bottom: 25),
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.skip_previous_rounded,
                                        color: Colors.grey.withOpacity(0.5),
                                        size: 50,
                                      )),
                              const SizedBox(
                                width: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 7),
                                child: IconButton(
                                    // constraints: BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      realtimePlayingInfos.isPlaying
                                          ? audioPlayer.pause()
                                          : audioPlayer.play();
                                    },
                                    icon: Icon(
                                      realtimePlayingInfos.isPlaying
                                          ? Icons.pause_circle
                                          : Icons.play_circle,
                                      color: white,
                                      size: 55,
                                    )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              realtimePlayingInfos.current!.audio.audio !=
                                      audioPlayer.playlist!.audios[(audioPlayer
                                              .playlist!.audios.length) -
                                          1]
                                  ? IconButton(
                                      constraints: const BoxConstraints(),
                                      padding: const EdgeInsets.only(
                                          right: 18, bottom: 25),
                                      onPressed: () async {
                                        if (songSkip) {
                                          songSkip = false;
                                          await audioPlayer.next();
                                          songSkip = true;
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.skip_next_rounded,
                                        color: white,
                                        size: 50,
                                      ))
                                  : IconButton(
                                      constraints: const BoxConstraints(),
                                      padding: const EdgeInsets.only(
                                          right: 18, bottom: 25),
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.skip_next_rounded,
                                        color: Colors.grey.withOpacity(0.5),
                                        size: 50,
                                      )),
                            ],
                          ),
                        )
                      ],
                    ),
                    LinearProgressIndicator(
                      minHeight: 2,
                      value: audioPlayer.currentPosition.value.inSeconds /
                          realtimePlayingInfos.duration.inSeconds,
                      backgroundColor: Colors.transparent,
                      valueColor: const AlwaysStoppedAnimation(white),
                    ),
                  ],
                );
              } else {
                return Column();
              }
            })));
  }
}
