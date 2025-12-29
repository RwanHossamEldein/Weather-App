import 'package:flutter/material.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';
import 'package:weather_app/features/forecast/presentation_layer/widgets/forecast_appbar.dart';
import 'package:weather_app/features/forecast/presentation_layer/widgets/forecast_list.dart';
import 'package:weather_app/features/forecast/presentation_layer/widgets/location_section.dart';
import 'package:weather_app/features/forecast/presentation_layer/widgets/today_summary_card.dart';
import 'package:weather_app/l10n/app_localizations.dart';

// ignore: must_be_immutable
class WeeklyForcast extends StatelessWidget {
  WeeklyForcast({super.key, required this.city});
  Model city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 20),
          ForecastAppBar(),
          LocationSection(city: city),
          SizedBox(height: 15),

          TodaySummaryCard(city: city),

          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.thisWeek,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          Expanded(
            child: Card(
              color: Theme.of(context).cardColor,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: city.forecast.forecastday.length,
                itemBuilder: (BuildContext context, int index) {
                  return ForecastItem(
                    forecastDay: city.forecast.forecastday[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
