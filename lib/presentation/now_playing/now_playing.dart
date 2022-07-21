import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/now_playing/widgets/add_fav_button.dart';
import 'package:music_player/presentation/now_playing/widgets/add_playlist_button.dart';
import 'package:music_player/presentation/now_playing/widgets/song_controllers.dart';
import 'package:music_player/presentation/now_playing/widgets/song_image.dart';
import 'package:on_audio_query/on_audio_query.dart';

final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

// Seek to another position
seekplayer(int sec) async {
  Duration position = Duration(seconds: sec);
  await audioPlayer.seek(position);
}

// Get Time In Min:Sec
String getTimeString(int second) {
  String minutes =
      '${(second / 60).floor() < 10 ? 0 : ''}${(second / 60).floor()}';
  String seconds = '${second % 60 < 10 ? 0 : ''}${second % 60}';
  return '$minutes:$seconds';
}

class NowPlaying extends StatelessWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return audioPlayer.builderRealtimePlayingInfos(
        builder: (context, realtimePlayingInfos) {
      return Stack(
        children: [
          QueryArtworkWidget(
              keepOldArtwork: true,
              nullArtworkWidget: Container(),
              artworkHeight: double.infinity,
              artworkWidth: double.infinity,
              id: int.parse(
                  realtimePlayingInfos.current!.audio.audio.metas.id!),
              type: ArtworkType.AUDIO),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Scaffold(
                backgroundColor: Colors.transparent,

                //Appbar
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  title: const Text('Now Playing'),
                  centerTitle: true,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                ),
                body: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: screenSize.height * 0.04),

                      // Song Image
                      SongImageWidget(
                        realtimePlayingInfos: realtimePlayingInfos,
                      ),

                      SizedBox(height: screenSize.height * 0.035),

                      //Songs Name
                      SizedBox(
                          width: 280,
                          height: 50,
                          child: Marquee(
                            text: audioPlayer.getCurrentAudioTitle,
                            style: whitetxt22,
                            scrollAxis: Axis.horizontal,
                            blankSpace: 50,
                            velocity: 30,
                            pauseAfterRound: const Duration(seconds: 1),
                            showFadingOnlyWhenScrolling: true,
                            fadingEdgeStartFraction: 0.1,
                            fadingEdgeEndFraction: 0.1,
                            startPadding: 10,
                            accelerationDuration: const Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration:
                                const Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          )),
                      SizedBox(height: screenSize.height * 0.035),

                      //Bottom controls Container
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: cardshomecolor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenSize.height * 0.025,
                              ),
                              //Favourites and playlists adding button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  // Add Favorites Button
                                  AddFavButtonWidget(),

                                  IconButton(
                                      onPressed: () {
                                        audioPlayer.toggleShuffle();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: const Text('Shuffled songs'),
                                          backgroundColor: Colors.purple[600],
                                          margin: EdgeInsets.only(
                                              bottom: screenSize.height * 0.12,
                                              left: screenSize.height * 0.15,
                                              right: screenSize.height * 0.15),
                                          behavior: SnackBarBehavior.floating,
                                          duration: const Duration(seconds: 1),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.shuffle_rounded,
                                        color: white,
                                        size: 30,
                                      )),

                                  // Add Playlist Button
                                  const AddPlaylistButtonWidget()
                                ],
                              ),
                              SizedBox(
                                height: screenSize.height * 0.04,
                              ),

                              //Slider bar
                              Slider(
                                  max: realtimePlayingInfos.duration.inSeconds
                                      .toDouble(),
                                  value: audioPlayer
                                      .currentPosition.value.inSeconds
                                      .toDouble(),
                                  onChanged: (double value) {
                                    seekplayer(value.toInt());
                                  }),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        getTimeString(realtimePlayingInfos
                                            .currentPosition.inSeconds),
                                        style: white54txt14),
                                    Text(
                                      getTimeString(realtimePlayingInfos
                                          .duration.inSeconds),
                                      style: white54txt14,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: screenSize.height * 0.045,
                              ),
                              //Music Controllers

                              SongControllerWidget(
                                  realtimePlayingInfos: realtimePlayingInfos)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ],
      );
    });
  }
}
