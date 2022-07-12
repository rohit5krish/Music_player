import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:music_player/presentation/home/widgets/songs_list.dart';
import 'package:music_player/presentation/settings/settings.dart';
import 'package:music_player/presentation/recent/recent.dart';
import 'package:music_player/presentation/now_playing/now_playing.dart';
import 'package:music_player/presentation/home/widgets/top_cards.dart';

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
        showNotification: isSwitched.value);

    // audioPlayer.playlistPlayAtIndex(index);

    getRecsongs();
    // recentdbsongs = dbBox.get('recent')!.cast<audioModel>();
    if (finalrecent.length < 15 &&
        !checkAdded(songsinlist[index].metas.title.toString(), recentdbsongs)) {
      finalrecent.add(songsinlist[index]);
      addRecDB();
    } else if (finalrecent.length < 15 &&
        checkAdded(songsinlist[index].metas.title.toString(), recentdbsongs)) {
      finalrecent.insert(finalrecent.length, songsinlist[index]);
      finalrecent.removeAt(finalrecent.indexOf(songsinlist[index]));
      addRecDB();
    } else if (checkAdded(
        songsinlist[index].metas.title.toString(), recentdbsongs)) {
      finalrecent.insert(finalrecent.length - 1, songsinlist[index]);
      finalrecent.removeAt(finalrecent.indexOf(songsinlist[index]));
      addRecDB();
    } else {
      finalrecent.removeAt(0);
      finalrecent.add(songsinlist[index]);
      addRecDB();
    }
  }
}
