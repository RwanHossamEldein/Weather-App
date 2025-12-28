import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';
import 'package:weather_app/features/current_weather/data_layer/repo.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/cubit/current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  final CurrentRepo repo;
  Model? _currentMainWeather;
  final List<Model> _savedLocationsList = [];
  final bool isDark = true;
  CurrentWeatherCubit(this.repo) : super(CurrentWeatherInitial());

  Future<void> loadInitialWeather(String city) async {
    emit(CurrentWeatherLoading());
    try {
      final weather = await repo.getCurrentWeather(city);
      _currentMainWeather = weather;

      emit(
        CurrentWeatherLoaded(
          currentWeather: _currentMainWeather!,
          savedLocations: List.from(_savedLocationsList),
        ),
      );
    } catch (e) {
      emit(CurrentWeatherError('There is a problem with $e'));
    }
  }

  Future<void> addSavedLocation(String city) async {
    if (_currentMainWeather == null) {
      return;
    }

    try {
      final newCityWeather = await repo.getCurrentWeather(city);
      if (_savedLocationsList.any(
        (item) =>
            item.location.name.toLowerCase() ==
            newCityWeather.location.name.toLowerCase(),
      )) {
        return;
      } else {
        _savedLocationsList.add(newCityWeather);

        emit(
          CurrentWeatherLoaded(
            currentWeather: _currentMainWeather!,
            savedLocations: List.from(_savedLocationsList),
          ),
        );
        saveCities();
      }
    } catch (e) {
      emit(CurrentWeatherError(e.toString()));
    }
  }

  Future<void> saveCities() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> citiesJson = _savedLocationsList
        .map((city) => jsonEncode(city.toJson()))
        .toList();
    await prefs.setStringList('savedCities', citiesJson);
  }

  Future<void> loadSavedLocations() async {
    final prefs = await SharedPreferences.getInstance();
    final citiesJson = prefs.getStringList('savedCities') ?? [];

    _savedLocationsList.clear();
    for (var cityStr in citiesJson) {
      final cityMap = jsonDecode(cityStr);
      _savedLocationsList.add(Model.fromJson(cityMap));
    }

    if (_currentMainWeather != null) {
      emit(
        CurrentWeatherLoaded(
          currentWeather: _currentMainWeather!,
          savedLocations: List.from(_savedLocationsList),
        ),
      );
    }
  }
}
