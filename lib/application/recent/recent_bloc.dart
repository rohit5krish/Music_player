import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/presentation/recent/recent.dart';
import 'package:music_player/splash.dart';

part 'recent_event.dart';
part 'recent_state.dart';
part 'recent_bloc.freezed.dart';

class RecentBloc extends Bloc<RecentEvent, RecentState> {
  RecentBloc() : super(RecentState.initial()) {
    on<GetRecentSongs>((event, emit) {
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
      emit(state.copyWith(
          recentSongs: _recentSongs, finalRecentSongs: _finalRecentSongs));
    });
    on<AddSongToRecent>((event, emit) {
      List<audioModel> _addRecentSongs = [];
      _addRecentSongs = dbBox.get(recent)!.cast<audioModel>();
      _addRecentSongs.add(event.songData);
      dbBox.put(recent, _addRecentSongs);
      emit(state.copyWith(recentSongs: _addRecentSongs));
    });
    on<DeleteAllRecentSongs>((event, emit) {
      List<audioModel> _allRecentSongs = [];
      dbBox.put(recent, _allRecentSongs);
    });
  }
}
