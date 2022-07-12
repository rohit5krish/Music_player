import 'package:flutter/material.dart';
import 'package:music_player/presentation/playlist/playlist.dart';
import 'package:music_player/splash.dart';

void deleteplaylist(BuildContext context, String boxkey) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Playlist?'),
          content: const Text('Are You Sure To Delete Playlist?'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No')),
            TextButton(
                onPressed: () async {
                  plylst.value.remove(boxkey);
                  plylst.notifyListeners();
                  await dbBox.put(plylstlisting, plylst.value);
                  await dbBox.delete(boxkey);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const musicPlaylist()),
                      (route) => false);
                },
                child: const Text('Yes'))
          ],
        );
      });
}
