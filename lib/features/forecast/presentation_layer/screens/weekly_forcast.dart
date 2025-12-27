import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';
import 'package:weather_app/features/forecast/presentation_layer/widgets/forecast_appbar.dart';
import 'package:weather_app/features/forecast/presentation_layer/widgets/forecast_list.dart';
import 'package:weather_app/features/forecast/presentation_layer/widgets/location_section.dart';
import 'package:weather_app/features/forecast/presentation_layer/widgets/today_summary_card.dart';

// ignore: must_be_immutable
class WeeklyForcast extends StatelessWidget {
  WeeklyForcast({super.key, required this.city});
  Model city;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Scaffold(
        backgroundColor: ColorsApp.backgroundDark,
        body: Column(
          children: [
            const ForecastAppBar(),
            LocationSection(city: city),
            SizedBox(height: 15),

            TodaySummaryCard(city: city),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(
                    'This Week',
                    style: TextStyle(
                      fontSize: 15,
                      color: ColorsApp.backgroundLight,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Card(
                color: const Color(0xFF1E2832),
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
      ),
    );
  }
}
