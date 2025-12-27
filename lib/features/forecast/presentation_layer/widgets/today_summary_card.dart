import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';

// ignore: must_be_immutable
class TodaySummaryCard extends StatelessWidget {
  Model city;
  TodaySummaryCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E2832),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Right Now",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 177, 175, 175),
                  ),
                ),
                Text(
                  style: TextStyle(
                    color: ColorsApp.backgroundLight,
                    fontSize: 20,
                  ),
                  "${city.current.tempC.round()}°",
                ),
                Text(
                  city.current.condition.text,
                  style: TextStyle(color: ColorsApp.primaryColor),
                ),
              ],
            ),
            Column(
              children: [
                Image.network(
                  'https:${city.current.condition.icon}',
                  width: 35,
                  height: 35,
                ),

                Text(
                  style: TextStyle(
                    color: const Color.fromARGB(255, 177, 175, 175),
                  ),
                  "H:${city.forecast.forecastday[0].day.maxtempC.round()}° L:${city.forecast.forecastday[0].day.mintempC.round()}°",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
