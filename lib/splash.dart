import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/home/home_page.dart';
import 'package:music_player/presentation/settings/settings.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:shared_preferences/shared_preferences.dart';

final OnAudioQuery audioQuery = OnAudioQuery();
final Box<List> dbBox = StorageBox.getInstance();
List<SongModel> allsongs = [];
List<SongModel> sortedsongs = [];
List<audioModel> modelListSongs = [];
List<audioModel> dbsongs = [];
List<Audio> finalsonglist = [];
late bool prefbool;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoHome();
  }

  Future gotoHome() async {
    await Future.delayed(Duration(seconds: 2));
    await requestPermission();
    await checkNoti();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return HomePage();
    }));
  }

// To check whether Notification is On/Off
  checkNoti() async {
    final pref = await SharedPreferences.getInstance();
    if (pref.getBool(prefKey) != null) {
      prefbool = pref.getBool(prefKey)!;
    } else {
      prefbool = true;
    }
  }

  requestPermission() async {
    // if (await Permission.storage.isGranted) {
    //   return true;
    // } else {
    //   var result = await Permission.storage.request();
    //   if (result == PermissionStatus.granted) {
    //     return true;
    //   } else {
    //     exit(0);
    //   }
    // }
    bool status = await audioQuery.permissionsStatus();
    if (!status) {
      bool result = await audioQuery.permissionsRequest();
      if (result == true) {
        await getsongs();
      } else {
        exit(0);
      }
    } else if (status) {
      await getsongs();
    }
  }

  Future getsongs() async {
    allsongs = await audioQuery.querySongs();
    for (var element in allsongs) {
      if (element.fileExtension == "mp3" && element.duration! >= 30000) {
        sortedsongs.add(element);
      }
    }

    modelListSongs = sortedsongs
        .map((music) => audioModel(
            id: music.id,
            songname: music.title,
            artist: music.artist.toString(),
            songuri: music.uri!))
        .toList();

    await dbBox.put('mymusic', modelListSongs);
    dbsongs = dbBox.get('mymusic') as List<audioModel>;

    for (var element in dbsongs) {
      finalsonglist.add(Audio.file(element.songuri,
          metas: Metas(
              title: element.songname,
              artist: element.artist,
              id: element.id.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/Music_splash.jpg'),
      ),
    );
  }
}
