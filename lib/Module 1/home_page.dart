// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/Module%201/search.dart';
import 'package:music_player/Module%201/settings.dart';
import 'package:music_player/Module%202/play_song.dart';
import 'package:music_player/Module%206/now_playing.dart';
import 'package:music_player/Widgets/home_widgets.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

ValueNotifier<bool> isVisible = ValueNotifier(false);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  makeVisible() {
    isVisible.value = true;
    isVisible.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      //Background Gradient Color
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [bggradient1, bggradient2])),
      child: Scaffold(
        backgroundColor: Colors.transparent,

        //Appbar Settings & Search
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Settings();
                }));
              },
              icon: Icon(Icons.settings)),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: songSearch());
                },
                icon: Icon(Icons.search_rounded))
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: screenheight * 0.03,
            ),
            //Top 3 Cards
            topHomeCards(),
            SizedBox(
              height: screenheight * 0.06,
            ),
            //My Music Bottom Portion
            ValueListenableBuilder(
              valueListenable: isVisible,
              builder: (BuildContext context, bool isVisible, Widget? child) {
                return Expanded(
                    child: Stack(
                  alignment: Alignment.center,
                  children: [
                    //Songs List
                    Container(
                      decoration: mymusicdecor,
                      width: screenwidth,
                      height: screenheight,
                      padding: EdgeInsets.only(top: 45, left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Music',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          SizedBox(
                            height: screenheight * 0.04,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    controller: ScrollController(
                                        keepScrollOffset: false),
                                    itemCount: finalsonglist.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          playSong().playinglist(
                                              finalsonglist, index);
                                          makeVisible();
                                        },
                                        child: Songs(
                                          img: QueryArtworkWidget(
                                              nullArtworkWidget: Icon(
                                                Icons.music_note,
                                                color: white,
                                                size: 30,
                                              ),
                                              id: int.parse(finalsonglist[index]
                                                  .metas
                                                  .id
                                                  .toString()),
                                              type: ArtworkType.AUDIO),
                                          songname: finalsonglist[index]
                                              .metas
                                              .title
                                              .toString(),
                                          artist: finalsonglist[index]
                                                      .metas
                                                      .artist
                                                      .toString() ==
                                                  '<unknown>'
                                              ? "Unknown Artist"
                                              : finalsonglist[index]
                                                  .metas
                                                  .artist
                                                  .toString(),
                                          index: index,
                                        ),
                                      );
                                    }),
                                isVisible
                                    ? SizedBox(
                                        height: 70,
                                      )
                                    : SizedBox(
                                        height: 10,
                                      )
                                // Text(
                                //   'Total 9 songs',
                                //   style: white54txt14,
                                //   textAlign: TextAlign.center,
                                // ),
                                // SizedBox(
                                //   height: 25,
                                // )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    //Current Playing bottom bar
                    Visibility(visible: isVisible, child: crntplayinghom())
                  ],
                ));
              },
            )
          ],
        ),
      ),
    );
  }
}
