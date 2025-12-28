import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';
import 'package:intl/intl.dart';

class ForecastItem extends StatelessWidget {
  final ForecastDay forecastDay;

  const ForecastItem({super.key, required this.forecastDay});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              style: Theme.of(context).textTheme.bodySmall,
              DateFormat('EEEE').format(DateTime.parse(forecastDay.date)),
            ),
          ),
          Image.network('https:${forecastDay.day.condition.icon}', width: 30),
          const SizedBox(width: 12),
          Expanded(
            child: LinearProgressIndicator(
              value: forecastDay.day.avgtempC / 50, // normalize
            ),
          ),
          const SizedBox(width: 12),
          Text(
            "${forecastDay.day.maxtempC.round()}°",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(width: 4),
          Text(
            "${forecastDay.day.mintempC.round()}°",
            style: TextStyle(color: ColorsApp.primaryColor),
          ),
        ],
      ),
    );
  }
}
