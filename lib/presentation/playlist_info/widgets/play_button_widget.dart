import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/application/playlist_info/playlist_info_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/play_song.dart';

class PlayButtonWidget extends StatelessWidget {
  const PlayButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaylistInfoBloc, PlaylistInfoState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            BlocProvider.of<HomeBloc>(context)
                .add(const HomeEvent.songPlayed());
            playSong().playinglist(state.finalPlaylistSongs, 0);
          },
          child: Container(
            height: 35,
            width: 75,
            decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.play_arrow_rounded,
                  color: white,
                  size: 20,
                ),
                Text(
                  'Play',
                  style: whitetxt15,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
