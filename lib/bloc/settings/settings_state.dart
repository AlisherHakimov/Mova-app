class SettingsState {
  bool isLight;
  String currentLanguage;
  SettingsState({
    this.isLight = false,
    this.currentLanguage = 'en',
  });

  SettingsState copyWith({
    bool? isLight,
    String? currentLanguage,
  }) {
    return SettingsState(
      isLight: isLight ?? this.isLight,
      currentLanguage: currentLanguage ?? this.currentLanguage,
    );
  }
}
