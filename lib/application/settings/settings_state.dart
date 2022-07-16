part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required bool isSwitched,
  }) = _SettingsState;

  factory SettingsState.initial() {
    return SettingsState(isSwitched: prefbool);
  }
}
