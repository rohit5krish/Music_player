import 'package:flutter/material.dart';
import 'package:music_player/presentation/playlist_info/widgets/add_song_playlist.dart';

class AddSongButtonWidget extends StatelessWidget {
  const AddSongButtonWidget({
    Key? key,
    required this.boxkey,
  }) : super(key: key);

  final String boxkey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            backgroundColor: MaterialStateProperty.all(Colors.blue[800])),
        onPressed: () {
          addsongplaylist(context, boxkey);
        },
        child: const Text('Add Song'));
  }
}
