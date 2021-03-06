import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/domain/model/data_model.dart';
import 'package:music_player/domain/playlist/playlist_service.dart';
import 'package:music_player/splash.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';
part 'playlist_bloc.freezed.dart';

@injectable
class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final PlaylistService _playlistService;
  PlaylistBloc(this._playlistService) : super(PlaylistState.initial()) {
    on<CreatePlylistNames>((event, emit) async {
      final updatedPlaylist = await _playlistService.createPlaylistNames(
          plylstName: event.plylistName);
      log('Bloc finished');
      emit(state.copyWith(playlistNames: updatedPlaylist));
    });

    on<MultiSelection>((event, emit) {
      List<String> _selectedPlylst = [];
      _selectedPlylst.addAll(state.selectedList);
      if (state.selectedList.contains(event.selectedPlaylist)) {
        _selectedPlylst.remove(event.selectedPlaylist);
      } else {
        _selectedPlylst.add(event.selectedPlaylist);
      }
      emit(state.copyWith(selectedList: _selectedPlylst));
    });

    on<UnselectAll>((event, emit) {
      List<String> _emptyList = [];
      emit(state.copyWith(selectedList: _emptyList));
    });

    on<EditPlaylistName>((event, emit) async {
      List<String> allPlylst = [];
      allPlylst.addAll(state.playlistNames);
      int index = allPlylst.indexOf(event.oldPlaylistName);
      allPlylst.replaceRange(index, index + 1, [event.newPlaylistName]);
      await dbBox.put(plylstlisting, allPlylst);
      await dbBox.put(event.newPlaylistName, event.plylstAllSongs);
      await dbBox.delete(event.oldPlaylistName);
      emit(state.copyWith(playlistNames: allPlylst));
    });
  }
}
