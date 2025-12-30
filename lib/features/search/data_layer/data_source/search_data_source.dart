import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/features/search/data_layer/model/search_location.dart';

abstract class SearchDataSource {
  Future<List<SearchLocation>> getCity(String cityName);
}

class SearchRemoteDataSourceImp implements SearchDataSource {
  String apiKey = 'ae0f3c2403924ff4bf3145704252212';
  String baseUrl = 'http://api.weatherapi.com/v1';

  @override
  Future<List<SearchLocation>> getCity(String cityName) async {
    final url = '$baseUrl/search.json?key=$apiKey&q=$cityName';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List decoded = jsonDecode(response.body);

        return decoded.map((e) => SearchLocation.fromJson(e)).toList();
      } else {
        throw Exception('Failed to search cities');
      }
    } on FormatException catch (e) {
      throw Exception('Failed to parse weather data $e');
    }
  }
}
