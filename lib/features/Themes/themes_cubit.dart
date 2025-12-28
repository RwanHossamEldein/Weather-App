import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/Themes/themes_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDark: true)) {
    loadTheme();
  }

  void toggleTheme() async {
    final newTheme = !state.isDark;
    emit(ThemeState(isDark: newTheme));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', newTheme);
  }

  void loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDark') ?? true;
    emit(ThemeState(isDark: isDark));
  }
}
