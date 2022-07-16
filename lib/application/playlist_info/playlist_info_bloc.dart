import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/splash.dart';

part 'playlist_info_event.dart';
part 'playlist_info_state.dart';
part 'playlist_info_bloc.freezed.dart';

class PlaylistInfoBloc extends Bloc<PlaylistInfoEvent, PlaylistInfoState> {
  PlaylistInfoBloc() : super(PlaylistInfoState.initial()) {
    on<GetPlaylistSongs>((event, emit) {
      List<Audio> _finalPlySongs = [];
      List<audioModel> _plySongs = [];
      _plySongs = dbBox.get(event.boxKey)!.cast<audioModel>();

      for (var element in _plySongs) {
        _finalPlySongs.add(Audio.file(element.songuri,
            metas: Metas(
                title: element.songname,
                artist: element.artist,
                id: element.id.toString())));
      }
      emit(state.copyWith(
          playlistSongs: _plySongs, finalPlaylistSongs: _finalPlySongs));
    });

    on<AddSongToPlaylist>((event, emit) {
      List<audioModel> _addPlySongs = [];
      _addPlySongs = dbBox.get(event.boxKey)!.cast<audioModel>();
      _addPlySongs.add(event.songDatas);
      dbBox.put(event.boxKey, _addPlySongs);
      emit(state.copyWith(playlistSongs: _addPlySongs));
    });

    on<DeletePlySong>((event, emit) {
      List<audioModel> _addPlySongs = [];
      _addPlySongs = dbBox.get(event.boxKey)!.cast<audioModel>();
      _addPlySongs.removeAt(event.index);
      dbBox.put(event.boxKey, _addPlySongs);
      emit(state.copyWith(playlistSongs: _addPlySongs));
    });
  }
}
