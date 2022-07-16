import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/splash.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';
part 'playlist_bloc.freezed.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  PlaylistBloc() : super(PlaylistState.initial()) {
    on<GetPlaylistNames>((event, emit) {
      List<String> _plylstNames = [];
      _plylstNames = dbBox.get(plylstlisting)!.cast<String>();
      emit(state.copyWith(playlistNames: _plylstNames));
    });
    on<CreateBlocPlaylist>((event, emit) {
      List<String> _playlistNames = [];
      _playlistNames = dbBox.get(plylstlisting)!.cast<String>();
      _playlistNames.add(event.newPlylstName);
      // dbBox.put(plylstlisting, _playlistNames);
      log('$_playlistNames');
      final newState = state.copyWith(playlistNames: _playlistNames);
      emit(newState);
    });
  }
}
