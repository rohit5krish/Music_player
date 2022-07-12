part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isVisible,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(isVisible: false);
  }
}
