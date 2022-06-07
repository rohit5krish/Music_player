// ignore_for_file: avoid_single_cascade_in_expression_statements, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/DB/data_model.dart';
import 'package:music_player/Module%201/home_page.dart';
import 'package:music_player/Module%202/play_song.dart';
import 'package:music_player/Module%203/favourites.dart';
import 'package:music_player/Module%204/playlist.dart';
import 'package:music_player/Widgets/home_widgets.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

ValueNotifier<List<audioModel>> plylstsongs = ValueNotifier([]);
ValueNotifier<List<Audio>> finalplylstsongs = ValueNotifier([]);

class PlaylistInfo extends StatefulWidget {
  PlaylistInfo({Key? key, required this.boxkey}) : super(key: key);
  String boxkey;

  @override
  State<PlaylistInfo> createState() => _PlaylistInfoState();
}

class _PlaylistInfoState extends State<PlaylistInfo> {
  TextEditingController _editctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    plylstsongs.value = dbBox.get(widget.boxkey)!.cast<audioModel>();
    getSongs();
  }

// Add Songs into Database
  Future<void> addtodb(index) async {
    plylstsongs.value = List.from(plylstsongs.value)..add(dbsongs[index]);
    await dbBox.put(widget.boxkey, plylstsongs.value);
    addedNoti(isadd: false, ctx: context, isfav: widget.boxkey);
  }

  getSongs() {
    finalplylstsongs.value.clear();
    for (var element in plylstsongs.value) {
      finalplylstsongs.value.add(Audio.file(element.songuri,
          metas: Metas(
              title: element.songname,
              artist: element.artist,
              id: element.id.toString())));
    }
    finalplylstsongs.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    List<String> plylstpoptop = ['Delete Playlist', 'Edit Playlist'];
    _editctrl.text = widget.boxkey;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [bggradient1, cardshomecolor, cardshomecolor])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          actions: [
            PopupMenuButton(
              icon: Icon(Icons.more_vert, color: Colors.grey),
              itemBuilder: (context) {
                return [
                  ...plylstpoptop.map((String value) {
                    return PopupMenuItem(value: value, child: Text(value));
                  }).toList()
                ];
              },
              onSelected: popselection,
            )
          ],
        ),
        body: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Icon(
                    Icons.music_note,
                    color: white,
                    size: 50,
                  ),
                  //  Image.asset('assets/mast_magan.jpg',
                  //     height: 150, width: 150)
                ),
                SizedBox(height: 10),
                Text(
                  widget.boxkey,
                  style: whitetxt18,
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        playSong().playinglist(finalplylstsongs.value, 0);
                      },
                      child: Container(
                        height: 35,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.blue[800],
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue[800])),
                        onPressed: () {
                          addsongplaylist(context);
                        },
                        child: Text('Add Song'))
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: finalplylstsongs,
                builder: (BuildContext context, List<Audio> finalplylstsongs,
                    Widget? child) {
                  return ListView.builder(
                      itemCount: finalplylstsongs.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            playSong().playinglist(finalplylstsongs, index);

                            isVisible.value = true;
                            isVisible.notifyListeners();
                          },
                          child: plylistsngs(
                            index: index,
                            img: QueryArtworkWidget(
                                nullArtworkWidget: Icon(Icons.music_note,
                                    color: white, size: 30),
                                id: int.parse(finalplylstsongs[index]
                                    .metas
                                    .id
                                    .toString()),
                                type: ArtworkType.AUDIO),
                            songname:
                                finalplylstsongs[index].metas.title.toString(),
                            artist: finalplylstsongs[index].metas.artist ==
                                    '<unknown>'
                                ? "Unknown Artist"
                                : finalplylstsongs[index]
                                    .metas
                                    .artist
                                    .toString(),
                            boxkey: widget.boxkey,
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  popselection(String value) async {
    if (value == 'Delete Playlist') {
      deleteplaylist();
    } else if (value == 'Edit Playlist') {
      editPlaylist();
    }
  }

  void deleteplaylist() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Playlist?'),
            content: Text('Are You Sure To Delete Playlist?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('No')),
              TextButton(
                  onPressed: () async {
                    plylst.value.remove(widget.boxkey);
                    plylst.notifyListeners();
                    await dbBox.put(plylstlisting, plylst.value);
                    await dbBox.delete(widget.boxkey);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => musicPlaylist()),
                        (route) => false);
                  },
                  child: Text('Yes'))
            ],
          );
        });
  }

  void editPlaylist() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit Playlist'),
            content: TextFormField(
              controller: _editctrl,
              decoration: InputDecoration(hintText: 'Playlist Name'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () async {
                    // Edit all Playlist List
                    int index = plylst.value.indexOf(widget.boxkey);
                    plylst.value
                        .replaceRange(index, index + 1, [_editctrl.text]);
                    plylst.notifyListeners();
                    await dbBox.put(plylstlisting, plylst.value);

                    // Edit Playlistinfo key
                    await dbBox.put(_editctrl.text, plylstsongs.value);
                    dbBox.delete(widget.boxkey);
                    setState(() {
                      widget.boxkey = _editctrl.text;
                    });
                    Navigator.of(context).pop();
                  },
                  child: Text('Update'))
            ],
          );
        });
  }

  void addsongplaylist(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: bggradient1,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            width: double.infinity,
            height: 500,
            child: Padding(
              padding: EdgeInsets.only(
                top: 40,
                left: 20,
                right: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Select Songs to add',
                      style: TextStyle(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        itemCount: dbsongs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: QueryArtworkWidget(
                                nullArtworkWidget: Icon(
                                  Icons.music_note,
                                  color: white,
                                ),
                                id: int.parse(dbsongs[index].id.toString()),
                                type: ArtworkType.AUDIO),
                            title: SizedBox(
                                width: 100,
                                child: Text(
                                  dbsongs[index].songname,
                                  style: TextStyle(color: white),
                                  overflow: TextOverflow.ellipsis,
                                )),
                            trailing: IconButton(
                                onPressed: () {
                                  checkAdded(dbsongs[index].songname,
                                          plylstsongs.value)
                                      ? addedNoti(
                                          isadd: true,
                                          ctx: context,
                                          isfav: widget.boxkey)
                                      : addtodb(index);
                                  getSongs();
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                )),
                          );
                        }),
                  )
                ],
              ),
            ),
          );
        });
  }
}

class plylistsngs extends StatefulWidget {
  final int index;
  final QueryArtworkWidget img;
  final String songname;
  final String artist;
  final String boxkey;

  plylistsngs(
      {required this.index,
      required this.img,
      required this.songname,
      required this.artist,
      required this.boxkey});

  static const removsong = 'Remove from Playlist';
  static const addfav = 'Add to Favourites';

  @override
  State<plylistsngs> createState() => _plylistsngsState();
}

class _plylistsngsState extends State<plylistsngs> {
  final List<String> plylstpoplist = [
    plylistsngs.removsong,
    plylistsngs.addfav
  ];
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    final int num = widget.index + 1;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                '$num',
                style: white54txt14,
              ),
              SizedBox(
                width: 15,
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(5), child: widget.img),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      widget.songname,
                      style: whitetxt15,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                      width: 200,
                      child: Text(
                        widget.artist,
                        style: white54txt14,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            ],
          ),
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.grey),
            itemBuilder: (context) {
              return [
                ...plylstpoplist.map((String value) {
                  return PopupMenuItem(value: value, child: Text(value));
                }).toList()
              ];
            },
            onSelected: plylistpopselection,
          )
        ],
      ),
    );
  }

  songDeletion() {
    plylstsongs.value.removeAt(widget.index);
    plylstsongs.notifyListeners();

    finalplylstsongs.value.removeAt(widget.index);
    finalplylstsongs.notifyListeners();

    dbBox.put(widget.boxkey, plylstsongs.value);
  }

  plylistpopselection(String value) async {
    if (value == plylistsngs.removsong) {
      songDeletion();
    } else if (value == plylistsngs.addfav) {
      checkAdded(widget.songname, favsonglist.value)
          ? addedNoti(isadd: true, ctx: ctx, isfav: 'Favourites')
          : favsonglist.value = List.from(favsonglist.value)
        ..add(plylstsongs.value[widget.index]);
      await dbBox.put(favsongs, favsonglist.value);
      favsonglist.notifyListeners();

      //  SnackBar
      addedNoti(isadd: false, ctx: ctx, isfav: 'Favourites');
    }
  }
}
