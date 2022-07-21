part of 'recent_bloc.dart';

@freezed
class RecentEvent with _$RecentEvent {
  const factory RecentEvent.getRecentSongs() = GetRecentSongs;
  const factory RecentEvent.addSongToRecent({
    required audioModel songData,
  }) = AddSongToRecent;
  const factory RecentEvent.deleteAllRecentSongs() = DeleteAllRecentSongs;
}
