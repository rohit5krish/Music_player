import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/playlist_info/playlist_info_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/playlist_info/playlist_info.dart';
import 'package:music_player/splash.dart';

List<String> selectedlist = [];

class PlaylistAlbums extends StatefulWidget {
  final String name;
  final int index;
  final ValueChanged<bool> isSelected;
  final int totalSongs;
  const PlaylistAlbums(
      {Key? key,
      required this.name,
      required this.index,
      required this.isSelected,
      required this.totalSongs})
      : super(key: key);

  @override
  State<PlaylistAlbums> createState() => _PlaylistAlbumsState();
}

class _PlaylistAlbumsState extends State<PlaylistAlbums> {
  bool isSelected = false;

  // @override
  // void initState() {
  //   super.initState();
  //   plylstsongs.value = dbBox.get(widget.name)!.cast<audioModel>();
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (selectedlist.length >= 1) {
          setState(() {
            isSelected = !isSelected;
            widget.isSelected(isSelected);
          });
        } else {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return PlaylistInfo(boxkey: widget.name);
          }));
        }
      },
      onLongPress: () {
        setState(() {
          isSelected = !isSelected;
          widget.isSelected(isSelected);
        });
      },
      child: Column(
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
                        child: isSelected && selectedlist.length >= 1
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
            widget.name,
            style: whitetxt18,
          ),
          Text(
            'Total ${widget.totalSongs} Songs',
            style: white54txt14,
          )
        ],
      ),
    );
  }
}
