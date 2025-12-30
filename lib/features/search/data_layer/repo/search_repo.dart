import 'package:weather_app/features/search/data_layer/data_source/search_data_source.dart';
import 'package:weather_app/features/search/data_layer/model/search_location.dart';

abstract class SearchRepo {
  Future<List<SearchLocation>> getCity(String cityName);
}

class SearchRepoImp extends SearchRepo {
  final SearchDataSource searchDataSource;

  SearchRepoImp(this.searchDataSource);
  @override
  Future<List<SearchLocation>> getCity(String cityName) async {
    return await searchDataSource.getCity(cityName);
  }
}
