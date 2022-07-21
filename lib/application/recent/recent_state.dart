part of 'recent_bloc.dart';

@freezed
class RecentState with _$RecentState {
  const factory RecentState({
    required List<Audio> finalRecentSongs,
    required List<audioModel> recentSongs,
  }) = _RecentState;

  factory RecentState.initial() {
    return RecentState(finalRecentSongs: [], recentSongs: []);
  }
}
