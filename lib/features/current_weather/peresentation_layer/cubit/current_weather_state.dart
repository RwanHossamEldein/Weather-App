import 'package:equatable/equatable.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';

abstract class CurrentWeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CurrentWeatherInitial extends CurrentWeatherState {}

class CurrentWeatherLoading extends CurrentWeatherState {}

class CurrentWeatherLoaded extends CurrentWeatherState {
  final Model currentWeather;
  final List<Model> savedLocations;

  CurrentWeatherLoaded({
    required this.currentWeather,
    required this.savedLocations,
  });

  @override
  List<Object?> get props => [currentWeather, savedLocations];
}

class CurrentWeatherError extends CurrentWeatherState {
  final String message;

  CurrentWeatherError(this.message);

  @override
  List<Object?> get props => [message];
}
