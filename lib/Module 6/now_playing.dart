// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/Module%203/favourites.dart';
import 'package:music_player/Widgets/home_widgets.dart';
import 'package:music_player/Widgets/playlist_widgets.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer.withId('0');

// void setupSongs() async {
//   await audioPlayer.open(Playlist(audios: finalsonglist),
//       showNotification: true,
//       notificationSettings:
//           NotificationSettings(stopEnabled: false, seekBarEnabled: true),
//       autoStart: false,
//       loopMode: LoopMode.none);
// }

// final List<Audio> audiofiles = [];

//Current Playing Song at Home screen Bottom
class crntplayinghom extends StatefulWidget {
  crntplayinghom({Key? key}) : super(key: key);

  @override
  State<crntplayinghom> createState() => _crntplayinghomState();
}

class _crntplayinghomState extends State<crntplayinghom> {
  Widget audioImage(RealtimePlayingInfos realtimePlayingInfos) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: QueryArtworkWidget(
            nullArtworkWidget: Icon(
              Icons.music_note,
              color: white,
              size: 40,
            ),
            id: int.parse(realtimePlayingInfos.current!.audio.audio.metas.id!),
            type: ArtworkType.AUDIO)
        // Image.asset(
        //   // realtimePlayingInfos.current!.audio.audio.metas.image!.path,
        //   fit: BoxFit.cover,
        //   height: 50,
        //   width: 50,
        // ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final double screenwidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(top: (screenwidth * 1.24)),
        child: Container(
            width: screenwidth - 25,
            height: 73,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: nowplayingbtm,
            ),
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                                return NowPlaying();
                              }));
                            },
                            child: Row(
                              children: [
                                audioImage(realtimePlayingInfos),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        audioPlayer.getCurrentAudioTitle,
                                        style: whitetxt15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
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
                          padding: const EdgeInsets.only(bottom: 16, right: 15),
                          child: Row(
                            children: [
                              realtimePlayingInfos.current!.audio.audio !=
                                      audioPlayer.playlist!.audios[0]
                                  ? IconButton(
                                      constraints: BoxConstraints(),
                                      // padding: EdgeInsets.zero,
                                      onPressed: () {
                                        audioPlayer.previous();
                                      },
                                      icon: Icon(
                                        Icons.skip_previous_rounded,
                                        color: white,
                                        size: 40,
                                      ))
                                  : IconButton(
                                      constraints: BoxConstraints(),
                                      // padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.skip_previous_rounded,
                                        color: Colors.black,
                                        size: 40,
                                      )),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: IconButton(
                                    constraints: BoxConstraints(),
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
                                      size: 50,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              realtimePlayingInfos.current!.audio.audio !=
                                      audioPlayer.playlist!.audios[(audioPlayer
                                              .playlist!.audios.length) -
                                          1]
                                  ? IconButton(
                                      constraints: BoxConstraints(),
                                      // padding: EdgeInsets.zero,
                                      onPressed: () {
                                        audioPlayer.next();
                                      },
                                      icon: Icon(
                                        Icons.skip_next_rounded,
                                        color: white,
                                        size: 45,
                                      ))
                                  : IconButton(
                                      constraints: BoxConstraints(),
                                      // padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.skip_next_rounded,
                                        color: Colors.black,
                                        size: 45,
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
                      valueColor: AlwaysStoppedAnimation(white),
                    ),
                  ],
                );
              } else {
                return Column();
              }
            })));
  }
}

// Seek to another position
seekplayer(int sec) {
  Duration position = Duration(seconds: sec);
  audioPlayer.seek(position);
}

// Get Time In Min:Sec
String getTimeString(int second) {
  String minutes =
      '${(second / 60).floor() < 10 ? 0 : ''}${(second / 60).floor()}';
  String seconds = '${second % 60 < 10 ? 0 : ''}${second % 60}';
  return '$minutes:$seconds';
}

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  removeFav() async {
    late int index;

    for (var element in favsonglist.value) {
      if (audioPlayer.getCurrentAudioTitle == element.songname) {
        index = favsonglist.value.indexOf(element);
        break;
      }
    }
    favsonglist.value.removeAt(index);
    favsonglist.notifyListeners();

    await dbBox.put(favsongs, favsonglist.value);
  }

  addFav() async {
    late int index;
    for (var element in dbsongs) {
      if (audioPlayer.getCurrentAudioTitle == element.songname) {
        index = dbsongs.indexOf(element);
        break;
      }
    }
    favsonglist.value = List.from(favsonglist.value)..add(dbsongs[index]);
    await dbBox.put(favsongs, favsonglist.value);
    favsonglist.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    return audioPlayer.builderRealtimePlayingInfos(
        builder: (context, realtimePlayingInfos) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Dekh_lena.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.screen),
                opacity: 0.7)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Scaffold(
              backgroundColor: Colors.transparent,

              //Appbar
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text('Now Playing'),
                centerTitle: true,
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
              ),
              body: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(height: 40),

                    //Song Image
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: QueryArtworkWidget(
                            nullArtworkWidget: Container(
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
                            id: int.parse(realtimePlayingInfos
                                .current!.audio.audio.metas.id!),
                            type: ArtworkType.AUDIO)),
                    SizedBox(height: 30),
                    //Songs Name
                    SizedBox(
                      width: 200,
                      child: Text(
                        audioPlayer.getCurrentAudioTitle,
                        style: whitetxt22,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 30),

                    //Bottom controls Container
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: cardshomecolor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            //Favourites and playlists adding button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        checkAdded(
                                                audioPlayer
                                                    .getCurrentAudioTitle,
                                                favsonglist.value)
                                            ? removeFav()
                                            : addFav();
                                      });
                                    },
                                    icon: checkAdded(
                                            audioPlayer.getCurrentAudioTitle,
                                            favsonglist.value)
                                        ? Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.red,
                                            size: 30,
                                          )
                                        : Icon(
                                            Icons.favorite_outline_rounded,
                                            color: white,
                                            size: 30,
                                          )),
                                IconButton(
                                    padding: EdgeInsets.all(0),
                                    onPressed: () {
                                      int index;
                                      for (var element in dbsongs) {
                                        // audioPlayer.getCurrentAudioTitle == element.songname?
                                        // index= dbsongs.indexOf(element):
                                        // index= 0;
                                        if (audioPlayer.getCurrentAudioTitle ==
                                            element.songname) {
                                          index = dbsongs.indexOf(element);
                                          selectPlaylist(
                                              context, dbsongs[index]);
                                          break;
                                        }
                                      }
                                    },
                                    icon: Icon(
                                      Icons.playlist_play_rounded,
                                      color: white,
                                      size: 40,
                                    ))
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),

                            //Slider bar
                            Slider(
                                max: realtimePlayingInfos.duration.inSeconds
                                    .toDouble(),
                                value: audioPlayer
                                    .currentPosition.value.inSeconds
                                    .toDouble(),
                                onChanged: (double value) {
                                  setState(() {
                                    seekplayer(value.toInt());
                                  });
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
                              height: 40,
                            ),
                            //Music Controllers

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                realtimePlayingInfos.current!.audio.audio !=
                                        audioPlayer.playlist!.audios[0]
                                    ? IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          audioPlayer.previous();
                                        },
                                        icon: Icon(Icons.skip_previous_rounded,
                                            color: white, size: 60))
                                    : IconButton(
                                        constraints: BoxConstraints(),
                                        // padding: EdgeInsets.zero,
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.skip_previous_rounded,
                                          color: Colors.black,
                                          size: 60,
                                        )),
                                IconButton(
                                    padding: EdgeInsets.all(0),
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
                                        audioPlayer.playlist!.audios[
                                            (audioPlayer
                                                    .playlist!.audios.length) -
                                                1]
                                    ? IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {
                                          audioPlayer.next();
                                        },
                                        icon: Icon(Icons.skip_next_rounded,
                                            color: white, size: 60))
                                    : IconButton(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {},
                                        icon: Icon(Icons.skip_next_rounded,
                                            color: Colors.black, size: 60)),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      );
    });
  }
}
