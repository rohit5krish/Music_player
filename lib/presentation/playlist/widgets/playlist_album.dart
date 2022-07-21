import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/playlist_info/playlist_info_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/playlist_info/playlist_info.dart';
import 'package:music_player/splash.dart';

// List<String> selectedlist = [];

class PlaylistAlbums extends StatelessWidget {
  final String name;
  final int index;
  final bool isSelected;
  final int totalNo;

  const PlaylistAlbums({
    Key? key,
    required this.name,
    required this.index,
    required this.isSelected,
    required this.totalNo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 130,
          width: 130,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Colors.blue,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: isSelected
                          ? const Icon(
                              Icons.check_box_outlined,
                              color: white,
                            )
                          : Container(),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.music_note,
                        color: white,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              )),
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          name,
          style: whitetxt18,
        ),
        Text(
          'Total $totalNo Songs',
          style: white54txt14,
        )
      ],
    );
  }
}
