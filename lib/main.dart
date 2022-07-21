import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:music_player/application/favorite/favorite_bloc.dart';
import 'package:music_player/application/home/home_bloc.dart';
import 'package:music_player/application/playlist/playlist_bloc.dart';
import 'package:music_player/application/playlist_info/playlist_info_bloc.dart';
import 'package:music_player/application/recent/recent_bloc.dart';
import 'package:music_player/application/settings/settings_bloc.dart';
import 'package:music_player/core/constants.dart';

import 'package:music_player/domain/core/di/injectable.dart';

import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/recent/recent.dart';
import 'package:music_player/presentation/favorite/favourites.dart';
import 'package:music_player/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureInjection();

  await Hive.initFlutter();

  // if (!Hive.isAdapterRegistered(audioModelAdapter().typeId)) {
  Hive.registerAdapter(audioModelAdapter());
  // }
  await Hive.openBox<List>(boxname);

  List<dynamic> boxKeys = dbBox.keys.toList();
  if (!(boxKeys.contains(plylstlisting))) {
    List<String> _plylstNames = [];
    await dbBox.put(plylstlisting, _plylstNames);
  }

  if (!(boxKeys.contains(favsongs))) {
    List<audioModel> _favSongsList = [];
    dbBox.put(favsongs, _favSongsList);
  }

  if (!(boxKeys.contains(recent))) {
    List<audioModel> _recentSongsList = [];
    await dbBox.put(recent, _recentSongsList);
  }
  runApp(const MusicPlayer());
}

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({Key? key}) : super(key: key);

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
              BlocProvider(create: (context) => FavoriteBloc()),
              BlocProvider(create: (context) => SettingsBloc()),
              BlocProvider(create: (context) => PlaylistInfoBloc()),
              BlocProvider(create: (context) => getIt<PlaylistBloc>()),
              BlocProvider(create: (context) => RecentBloc()),
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
