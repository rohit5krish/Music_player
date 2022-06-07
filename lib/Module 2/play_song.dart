import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/DB/data_model.dart';
import 'package:music_player/Module%202/recent.dart';
import 'package:music_player/Module%203/favourites.dart';
import 'package:music_player/Module%206/now_playing.dart';
import 'package:music_player/splash.dart';

class playSong {
  // final List<Audio> songrecent;
  // final int index;

  // playSong(this.songrecent, this.index);

  playinglist(List<Audio> songsinlist, int index) {
    audioPlayer.open(
        Playlist(
          audios: songsinlist,
          startIndex: index,
        ),
        notificationSettings:
            NotificationSettings(stopEnabled: false, seekBarEnabled: true),
        autoStart: true,
        loopMode: LoopMode.none,
        showNotification: true);
    // audioPlayer.playlistPlayAtIndex(index);

    getRecsongs();
    // recentdbsongs = dbBox.get('recent')!.cast<audioModel>();
    if (finalrecent.length < 15) {
      finalrecent.add(songsinlist[index]);
      addRecDB();
    } else {
      finalrecent.removeAt(0);
      finalrecent.add(songsinlist[index]);
      addRecDB();
    }
  }

  addRecDB() {
    // recentdbsongs = dbBox.get('recent')!.cast<audioModel>();
    recentdbsongs.clear();
    for (var element in finalrecent) {
      recentdbsongs.add(audioModel(
          id: int.parse(element.metas.id.toString()),
          songname: element.metas.title.toString(),
          artist: element.metas.artist.toString(),
          songuri: element.path));
    }
    dbBox.put('recent', recentdbsongs);
  }
}
