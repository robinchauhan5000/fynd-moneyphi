part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  bool isDarkThemeOn;
  ThemeData theme;

  factory ThemeState.initial() {
    return ThemeState(
        isDarkThemeOn: false, theme: appThemeData[AppTheme.LightAppTheme]!);
  }

  ThemeState({required this.isDarkThemeOn, required this.theme});

  ThemeState copyWith({
    bool? isDarkThemeOn,
    ThemeData? theme,
  }) {
    return ThemeState(
      isDarkThemeOn: isDarkThemeOn ?? this.isDarkThemeOn,
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object?> get props => [theme, isDarkThemeOn];
}
