import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/Module%201/settings.dart';
import 'package:music_player/Module%202/recent.dart';
import 'package:music_player/Module%206/now_playing.dart';
import 'package:music_player/Widgets/home_widgets.dart';

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
        showNotification: isSwitched.value);

    // audioPlayer.playlistPlayAtIndex(index);

    getRecsongs();
    // recentdbsongs = dbBox.get('recent')!.cast<audioModel>();
    if (finalrecent.length < 15
        //  && !checkAdded(audioPlayer.getCurrentAudioTitle, recentdbsongs)
        ) {
      finalrecent.add(songsinlist[index]);
      addRecDB();
    }
    // else if (checkAdded(audioPlayer.getCurrentAudioTitle, recentdbsongs)) {
    //   finalrecent.insert(finalrecent.length - 1, songsinlist[index]);
    //   finalrecent.removeAt(index);
    //   addRecDB();
    // }
    else {
      finalrecent.removeAt(0);
      finalrecent.add(songsinlist[index]);
      addRecDB();
    }
  }
}
