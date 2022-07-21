import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/application/recent/recent_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/play_song.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';

const String recent = 'recent';

class Recent extends StatelessWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<RecentBloc>(context).add(const GetRecentSongs());
    });
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<RecentBloc>(context)
                    .add(const DeleteAllRecentSongs());
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
      body: BlocBuilder<RecentBloc, RecentState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: state.recentSongs.isEmpty
                ? const Center(
                    child: Text(
                      'No Recent Songs',
                      style: whitetxt18,
                    ),
                  )
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.finalRecentSongs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          playSong().playinglist(state.finalRecentSongs,
                              (state.finalRecentSongs.length - index) - 1);
                          BlocProvider.of<HomeBloc>(context)
                              .add(const HomeEvent.songPlayed());
                        },
                        child: Songs(
                            songData: state.finalRecentSongs[
                                (state.finalRecentSongs.length - index) - 1],
                            index: index),
                      );
                    }),
          );
        },
      ),
    );
  }
}
