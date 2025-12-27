import 'package:intl/intl.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';

extension ForecastDayX on ForecastDay {
  String get displayDay {
    final dateTime = DateTime.parse(date);
    final now = DateTime.now();

    final isToday =
        dateTime.year == now.year &&
        dateTime.month == now.month &&
        dateTime.day == now.day;

    if (isToday) {
      return 'Today';
    }

    return DateFormat('EEE').format(dateTime);
  }
}
