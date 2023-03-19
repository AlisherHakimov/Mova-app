import 'package:bloc/bloc.dart';
import 'package:mova_app/bloc/settings/settings_state.dart';

import '../../services/hive_service.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  getTheme(bool isLight) {
    emit(
      state.copyWith(isLight: isLight),
    );
  }

  changeTheme() {
    emit(
      state.copyWith(isLight: !state.isLight),
    );
  }

  changeLanguage(String? language) {
    HiveService.saveLanguage(language);
    emit(
      state.copyWith(currentLanguage: language),
    );
  }
}
