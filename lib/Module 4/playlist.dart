// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/DB/data_model.dart';
import 'package:music_player/Module%205/playlist_info.dart';
import 'package:music_player/Widgets/playlist_widgets.dart';
import 'package:music_player/splash.dart';

class musicPlaylist extends StatefulWidget {
  musicPlaylist({Key? key}) : super(key: key);

  @override
  State<musicPlaylist> createState() => _musicPlaylistState();
}

ValueNotifier<List<String>> plylst = ValueNotifier([]);
final String plylstlisting = 'plylist';
getFromDb() {
  plylst.value = dbBox.get(plylstlisting)!.cast<String>();
}

TextEditingController playlistctrl = TextEditingController();

class _musicPlaylistState extends State<musicPlaylist> {
  @override
  void initState() {
    super.initState();
    getFromDb();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedlist.length >= 1) {
          setState(() {
            selectedlist.clear();
          });
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
          //AppBar With add Playlist button
          appBar: AppBar(
            title: Text(selectedlist.length >= 1
                ? '${selectedlist.length} Selected'
                : 'Playlists'),
            centerTitle: true,
            toolbarHeight: 65,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: selectedlist.length >= 1
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        selectedlist.clear();
                      });
                    },
                    icon: Icon(Icons.close))
                : IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
            actions: [
              selectedlist.length >= 1
                  ? IconButton(
                      onPressed: () {
                        gridDeletion();
                      },
                      icon: Icon(Icons.delete))
                  : IconButton(
                      onPressed: () {
                        showBottom(context: context, addply: false);
                      },
                      icon: Icon(Icons.add_circle_outline))
            ],
          ),
          backgroundColor: bodyclr,
          body: ValueListenableBuilder(
              valueListenable: plylst,
              builder:
                  (BuildContext context, List<String> plylst, Widget? child) {
                return plylst.isEmpty
                    ? Center(
                        child: Text(
                          'No Playlists',
                          style: whitetxt22,
                        ),
                      )
                    : GridView.builder(
                        padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 40),
                        itemCount: plylst.length,
                        itemBuilder: (context, index) {
                          return playlistalbums(
                            name: plylst[index],
                            index: index,
                            isSelected: (bool value) {
                              setState(() {
                                if (value) {
                                  selectedlist.add(plylst[index]);
                                } else {
                                  selectedlist.remove(plylst[index]);
                                }
                              });
                            },
                          );
                        });
              })),
    );
  }

  gridDeletion() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Playlist?'),
            content:
                Text('Are You Sure To Want to Delete the Selected Playlists?'),
            actions: [
              TextButton(
                  onPressed: () async {
                    for (int i = 0; i < selectedlist.length; i++) {
                      plylst.value.remove(selectedlist[i]);
                      dbBox.delete(selectedlist[i]);
                      await dbBox.put(plylstlisting, plylst.value);
                    }
                    plylst.notifyListeners();
                    setState(() {
                      selectedlist.clear();
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No'))
            ],
          );
        });
  }

  // deletebox() async {
  //   await dbBox.delete(boxname);
  //   await Hive.box(boxname).clear();
  //   await Hive.box(boxname).close();
  // }

}

showBottom(
    {required BuildContext context,
    required bool addply,
    audioModel? element}) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: bggradient1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Create Playlist',
                style: TextStyle(
                  color: white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: TextFormField(
                  autofocus: true,
                  controller: playlistctrl,
                  style: TextStyle(color: white),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Playlist Name',
                      hintStyle: TextStyle(color: Colors.grey[350])),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 100,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        playlistctrl.clear();
                      },
                      child: Text('Cancel'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.grey)),
                    ),
                  ),
                  SizedBox(
                      width: 100,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () async {
                            int index;
                            await createplylist();
                            if (addply) {
                              plylst.value =
                                  dbBox.get(plylstlisting)!.cast<String>();
                              index = (plylst.value.length) - 1;
                              plylstsongs.value = dbBox
                                  .get(plylst.value[index])!
                                  .cast<audioModel>();
                              await addSongPlylst(context, index, element!);
                            }
                            Navigator.of(context).pop();
                            playlistctrl.clear();
                          },
                          child: Text('Create'))),
                ],
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
        );
      });
}

Future<void> createplylist() async {
  final _plylistname = playlistctrl.text.trim();
  List<audioModel> _plylstsngs = [];
  if (_plylistname.isEmpty) {
    return;
  } else {
    plylst.value = List.from(plylst.value)..add(_plylistname);
    plylst.notifyListeners();
    await dbBox.put(plylstlisting, plylst.value);
    await dbBox.put(_plylistname, _plylstsngs);
  }
}
