import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';
import 'package:weather_app/l10n/app_localizations.dart';

// ignore: must_be_immutable
class TodaySummaryCard extends StatelessWidget {
  Model city;
  TodaySummaryCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
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
                  AppLocalizations.of(context)!.rightNow,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  style: Theme.of(context).textTheme.bodyLarge,
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
                  style: Theme.of(context).textTheme.bodySmall,
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
