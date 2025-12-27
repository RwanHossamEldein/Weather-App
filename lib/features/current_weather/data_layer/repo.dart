import 'package:weather_app/features/current_weather/data_layer/data_source.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';

abstract class CurrentRepo {
  Future<Model> getCurrentWeather(String cityName);
}

class CurrentRepoImp extends CurrentRepo {
  final CurrentDataSource currentDataSource;
  CurrentRepoImp(this.currentDataSource);

  @override
  Future<Model> getCurrentWeather(String cityName) {
    return currentDataSource.getCurrentWeather(cityName);
  }
}
