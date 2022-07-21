import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';
import 'package:music_player/presentation/recent/recent.dart';
import 'package:music_player/presentation/now_playing/now_playing.dart';
import 'package:music_player/splash.dart';

class playSong {
  playinglist(List<Audio> songsinlist, int index) {
    audioPlayer.open(
        Playlist(
          audios: songsinlist,
          startIndex: index,
        ),
        notificationSettings: const NotificationSettings(
            stopEnabled: false, seekBarEnabled: true),
        autoStart: true,
        loopMode: LoopMode.none,
        showNotification: prefbool);

    // audioPlayer.playlistPlayAtIndex(index);

    List<Audio> _finalRecentSongs = [];
    List<audioModel> _recentSongs = [];
    _recentSongs = dbBox.get(recent)!.cast<audioModel>();

    for (var element in _recentSongs) {
      _finalRecentSongs.add(Audio.file(element.songuri,
          metas: Metas(
              title: element.songname,
              artist: element.artist,
              id: element.id.toString())));
    }
    if (_finalRecentSongs.length < 15 &&
        !checkAdded(songsinlist[index].metas.title.toString(), _recentSongs)) {
      _finalRecentSongs.add(songsinlist[index]);
      addRecDb(_recentSongs, _finalRecentSongs);
    } else if (_finalRecentSongs.length < 15 &&
        checkAdded(songsinlist[index].metas.title.toString(), _recentSongs)) {
      _finalRecentSongs.insert(_finalRecentSongs.length, songsinlist[index]);
      _finalRecentSongs.removeAt(_finalRecentSongs.indexOf(songsinlist[index]));
      addRecDb(_recentSongs, _finalRecentSongs);
    } else if (checkAdded(
        songsinlist[index].metas.title.toString(), _recentSongs)) {
      _finalRecentSongs.insert(
          _finalRecentSongs.length - 1, songsinlist[index]);
      _finalRecentSongs.removeAt(_finalRecentSongs.indexOf(songsinlist[index]));
      addRecDb(_recentSongs, _finalRecentSongs);
    } else {
      _finalRecentSongs.removeAt(0);
      _finalRecentSongs.add(songsinlist[index]);
      addRecDb(_recentSongs, _finalRecentSongs);
    }
  }
}

addRecDb(List<audioModel> _recSongs, List<Audio> _finalRecSong) {
  _recSongs.clear();
  for (var element in _finalRecSong) {
    _recSongs.add(audioModel(
        id: int.parse(element.metas.id.toString()),
        songname: element.metas.title.toString(),
        artist: element.metas.artist.toString(),
        songuri: element.path));
  }
  dbBox.put(recent, _recSongs);
}
