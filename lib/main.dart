import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/recent/recent.dart';
import 'package:music_player/presentation/favorite/favourites.dart';
import 'package:music_player/presentation/playlist/playlist.dart';
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

  if (!(boxKeys.contains(recent))) {
    await dbBox.put(recent, recentdbsongs);
  }
  //  else if (boxKeys.contains(recent)) {
  //   recentdbsongs = dbBox.get(recent)!.cast<audioModel>();
  // }
  runApp(const MusicPlayer());
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => HomeBloc()),
            ],
            child: MaterialApp(
              theme: ThemeData(primarySwatch: Colors.blue),
              home: const SplashScreen(),
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
