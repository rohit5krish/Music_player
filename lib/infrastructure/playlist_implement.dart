import 'package:injectable/injectable.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/domain/playlist/playlist_service.dart';
import 'package:music_player/presentation/playlist/playlist.dart';
import 'package:music_player/splash.dart';

@LazySingleton(as: PlaylistService)
class PlaylistImplement implements PlaylistService {
  @override
  Future<List<String>> createPlaylistNames({required String plylstName}) async {
    List<String> _playlistNames = [];
    _playlistNames.addAll(dbBox.get(plylstlisting)!.cast<String>());
    _playlistNames.add(plylstName);
    await dbBox.put(plylstlisting, _playlistNames);
    return _playlistNames;
  }
}
