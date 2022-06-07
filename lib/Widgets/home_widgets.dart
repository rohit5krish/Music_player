import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/DB/data_model.dart';

import 'package:music_player/Module%202/recent.dart';
import 'package:music_player/Module%203/favourites.dart';
import 'package:music_player/Module%204/playlist.dart';
import 'package:music_player/Module%205/playlist_info.dart';
import 'package:music_player/Widgets/playlist_widgets.dart';
import 'package:music_player/splash.dart';
import 'package:on_audio_query/on_audio_query.dart';

//Top Cards In Home Screen
class topHomeCards extends StatelessWidget {
  const topHomeCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenheight = MediaQuery.of(context).size.height;
    final double screenwidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Recent();
            }));
          },
          child: Container(
            width: screenwidth * 0.22,
            height: screenheight * 0.14,
            decoration: contborder,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.watch_later_rounded,
                  color: white,
                  size: 30,
                ),
                SizedBox(
                  height: screenheight * 0.015,
                ),
                Text(
                  'Recent',
                  style: TextStyle(color: white, fontSize: 16),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Favourites();
            }));
          },
          child: Container(
            width: screenwidth * 0.22,
            height: screenheight * 0.14,
            decoration: contborder,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_rounded,
                  color: white,
                  size: 30,
                ),
                SizedBox(
                  height: screenheight * 0.015,
                ),
                Text(
                  'Favourites',
                  style: TextStyle(color: white, fontSize: 16),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return musicPlaylist();
            }));
          },
          child: Container(
            width: screenwidth * 0.22,
            height: screenheight * 0.14,
            decoration: contborder,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.my_library_music,
                  color: white,
                  size: 30,
                ),
                SizedBox(
                  height: screenheight * 0.015,
                ),
                Text(
                  'Playlists',
                  style: TextStyle(color: white, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//Contents in Bottom My Music
// class MyMusicCont extends StatefulWidget {
//   const MyMusicCont({Key? key}) : super(key: key);

//   @override
//   State<MyMusicCont> createState() => _MyMusicContState();
// }

// class _MyMusicContState extends State<MyMusicCont> {
//   @override
//   Widget build(BuildContext context) {
//     final double screenheight = MediaQuery.of(context).size.height;
//     final double screenwidth = MediaQuery.of(context).size.width;

//     return
//   }
// }

//Song Thumbnail Image
// class songCoverImg extends StatelessWidget {
//   final String img;

//   const songCoverImg({required this.img});

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(5),
//       child: Image.asset(
//         img,
//         fit: BoxFit.cover,
//       ),
//     );
//   }
// }

//Songs List Making
class Songs extends StatelessWidget {
  final QueryArtworkWidget img;
  final String songname;
  final String artist;
  final int index;

  Songs(
      {required this.img,
      required this.songname,
      required this.artist,
      required this.index});

  static const String delete = 'Delete';
  static const String addplaylist = 'Add to Playlist';
  static const String addfavourite = 'Add to Favourites';
  final List<String> popuplist = [delete, addplaylist, addfavourite];
  late BuildContext ctx;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(height: 50, width: 50, child: img),
                SizedBox(
                  width: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            songname,
                            style: whitetxt15,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            artist,
                            overflow: TextOverflow.ellipsis,
                            style: white30txt12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            PopupMenuButton(
              icon: Icon(Icons.more_vert, color: Colors.grey),
              itemBuilder: (context) {
                return [
                  ...popuplist.map((String value) {
                    return PopupMenuItem(
                        height: 35,
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 12),
                        ));
                  }).toList()
                ];
              },
              padding: EdgeInsets.all(5),
              onSelected: popupselection,
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  popupselection(String value) async {
    if (value == delete) {
      print(value);
    } else if (value == addplaylist) {
      selectPlaylist(ctx, dbsongs[index]);
    } else if (value == addfavourite) {
      checkAdded(songname, favsonglist.value)
          ? addedNoti(isadd: true, ctx: ctx, isfav: 'Favourites')
          : favsonglist.value = List.from(favsonglist.value)
        ..add(dbsongs[index]);
      await dbBox.put(favsongs, favsonglist.value);
      favsonglist.notifyListeners();

      //  SnackBar
      addedNoti(isadd: false, ctx: ctx, isfav: 'Favourites');
    }
  }
}

addedNoti(
    {required bool isadd, required BuildContext ctx, required String isfav}) {
  ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      backgroundColor: bggradient1,
      duration: Duration(seconds: 4),
      content:
          isadd ? Text('Already Added to $isfav') : Text('Added to $isfav')));
}

bool checkAdded(String songname, List songslist) {
  bool check = false;
  for (var element in songslist) {
    if (songname == element.songname) {
      check = true;
      break;
    }
  }
  if (check) {
    return true;
  } else {
    return false;
  }
}

// Audio find(List<Audio> source, String frompath) {
//   return source.firstWhere((element) => element.path == frompath);
// }

