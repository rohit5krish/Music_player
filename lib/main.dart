import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/DB/data_model.dart';
import 'package:music_player/Module%202/recent.dart';
import 'package:music_player/Module%203/favourites.dart';
import 'package:music_player/Module%204/playlist.dart';
import 'package:music_player/Module%205/playlist_info.dart';
import 'package:music_player/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // if (!Hive.isAdapterRegistered(audioModelAdapter().typeId)) {
  Hive.registerAdapter(audioModelAdapter());
  // }
  await Hive.openBox<List>(boxname);

  List<dynamic> boxKeys = dbBox.keys.toList();
  if (!(boxKeys.contains(plylstlisting))) {
    await dbBox.put(plylstlisting, plylst.value);
  } else if (boxKeys.contains(plylstlisting)) {
    plylst.value = dbBox.get(plylstlisting)!.cast<String>();
  }

  if (!(boxKeys.contains(favsongs))) {
    dbBox.put(favsongs, favsonglist.value);
  } else if (boxKeys.contains(favsongs)) {
    favsonglist.value = dbBox.get(favsongs)!.cast<audioModel>();
  }

  if (!(boxKeys.contains('recent'))) {
    await dbBox.put('recent', recentdbsongs);
  }
  runApp(MusicPlayer());
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
