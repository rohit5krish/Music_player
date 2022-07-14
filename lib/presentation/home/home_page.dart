import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/home/widgets/current_playing.dart';
import 'package:music_player/presentation/home/widgets/search.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';
import 'package:music_player/presentation/now_playing/now_playing.dart';
import 'package:music_player/presentation/settings/settings.dart';
import 'package:music_player/domain/play_song.dart';
import 'package:music_player/presentation/home/widgets/top_cards.dart';
import 'package:music_player/splash.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: SafeArea(
        maintainBottomViewPadding: true,
        child: Container(
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
                      return const Settings();
                    }));
                  },
                  icon: const Icon(Icons.settings)),
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: SongSearch());
                    },
                    icon: const Icon(Icons.search_rounded))
              ],
            ),
            body: Column(
              children: [
                SizedBox(
                  height: screenheight * 0.03,
                ),
                //Top 3 Cards
                const TopHomeCards(),
                SizedBox(
                  height: screenheight * 0.06,
                ),
                //My Music Bottom Portion
                Expanded(
                    child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    //Songs List
                    Container(
                      decoration: mymusicdecor,
                      width: screenwidth,
                      height: screenheight,
                      padding:
                          const EdgeInsets.only(top: 45, left: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'My Music',
                            style: TextStyle(color: white, fontSize: 20),
                          ),
                          SizedBox(
                            height: screenheight * 0.04,
                          ),
                          Expanded(
                            child: ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    controller: ScrollController(
                                        keepScrollOffset: false),
                                    itemCount: finalsonglist.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          BlocProvider.of<HomeBloc>(context)
                                              .add(
                                                  const HomeEvent.songPlayed());
                                          playSong().playinglist(
                                              finalsonglist, index);
                                        },
                                        child: Songs(
                                            songData: finalsonglist[index],
                                            index: index),
                                      );
                                    }),
                                BlocBuilder<HomeBloc, HomeState>(
                                  builder: (context, state) {
                                    return state.isVisible
                                        ? const SizedBox(
                                            height: 70,
                                          )
                                        : const SizedBox(
                                            height: 10,
                                          );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    //Current Playing bottom bar
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return Visibility(
                            visible: state.isVisible, child: crntplayinghom());
                      },
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
