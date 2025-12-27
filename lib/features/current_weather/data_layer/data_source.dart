import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/current_weather/data_layer/model.dart';

abstract class CurrentDataSource {
  Future<Model> getCurrentWeather(String cityName);
}

class CurrentRemoteDataSourceImp implements CurrentDataSource {
  String apiKey = 'ae0f3c2403924ff4bf3145704252212';
  String baseUrl = 'http://api.weatherapi.com/v1';

  @override
  Future<Model> getCurrentWeather(String cityName) async {
    final url =
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7&aqi=no&alerts=no';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> parsedJson = jsonDecode(response.body);
        return Model.fromJson(parsedJson);
      } else {
        final errorBody = jsonDecode(response.body);
        final errorMessage = errorBody['error']?['message'] ?? 'Unknown error';

        throw Exception('API Error: $errorMessage');
      }
    } on FormatException catch (e) {
      throw Exception('Failed to parse weather data $e');
    }
  }
}
