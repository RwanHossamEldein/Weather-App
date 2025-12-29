import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/localization/localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState(language: 'en')) {
    loadSavedLanguage();
  }
  void toggleLanguage() async {
    final newLanguage = state.language == 'en' ? 'ar' : 'en';
    emit(LocalizationState(language: newLanguage));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', newLanguage);
  }

  void loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('language') ?? 'en';

    emit(LocalizationState(language: savedLang));
  }
}
