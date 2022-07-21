import 'package:flutter/material.dart';

import 'package:music_player/core/constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/playlist/playlist_bloc.dart';

import 'package:music_player/presentation/playlist/playlist.dart';
import 'package:music_player/splash.dart';

void deleteplaylist(
    {required BuildContext context,
    required bool isMultiDelete,
    String? boxkey,
    List<String>? selectedPlylsts}) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Playlist?'),
          content: isMultiDelete
              ? const Text('Are You sure to Delete the selected Playlists?')
              : const Text('Are You sure to delete the playlist?'),
          actions: [
            isMultiDelete
                ? TextButton(
                    onPressed: () async {
                      List<String> plylst =
                          dbBox.get(plylstlisting)!.cast<String>();
                      for (final data in selectedPlylsts!) {
                        plylst.remove(data);
                        await dbBox.delete(data);
                      }

                      await dbBox.put(plylstlisting, plylst);
                      BlocProvider.of<PlaylistBloc>(context)
                          .add(const UnselectAll());
                      Navigator.of(context).pop();
                    },
                    child: const Text('Yes'))
                : TextButton(
                    onPressed: () async {
                      List<String> plylst =
                          dbBox.get(plylstlisting)!.cast<String>();
                      plylst.remove(boxkey);
                      await dbBox.put(plylstlisting, plylst);
                      await dbBox.delete(boxkey);
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => musicPlaylist()),
                          (route) => false);
                    },
                    child: const Text('Yes')),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No')),
          ],
        );
      });
}
