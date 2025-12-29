import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';
import 'package:weather_app/features/current_weather_display/peresentation_layer/widgets/HourlyItem.dart';
import 'package:weather_app/features/current_weather_display/peresentation_layer/widgets/info_card.dart';
import 'package:weather_app/features/current_weather_display/peresentation_layer/widgets/top_app_bar.dart';
import 'package:weather_app/l10n/app_localizations.dart';

// ignore: must_be_immutable
class CurrentWeatherDisplayScreen extends StatelessWidget {
  Model city;
  CurrentWeatherDisplayScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopAppBar(city: city),
            Image.network(
              'https:${city.current.condition.icon}',
              width: 180,
              height: 180,
            ),
            Text(
              '${city.current.tempC}°',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 193, 194, 196),
              ),
            ),
            Text(
              city.current.condition.text,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ColorsApp.primaryColor,
              ),
            ),
            SizedBox(height: 10),
            Chip(
              label: Text(
                'H: ${city.forecast.forecastday.first.day.maxtempC}° | L: ${city.forecast.forecastday.first.day.mintempC}°',
              ),
            ),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.6,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              children: [
                InfoCard(
                  icon: Icons.air,
                  title: AppLocalizations.of(context)!.wind,
                  value: '${city.current.windKph} kph',
                ),
                InfoCard(
                  icon: Icons.water_drop,
                  title: AppLocalizations.of(context)!.humidity,
                  value: '${city.current.humidity}%',
                ),
                InfoCard(
                  icon: Icons.cloud,
                  title: AppLocalizations.of(context)!.rain,
                  value:
                      '${city.forecast.forecastday[0].day.dailyChanceOfRain}%',
                ),
                InfoCard(
                  icon: Icons.sunny,
                  title: AppLocalizations.of(context)!.uvIndex,
                  value: city.current.uv.toString(),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (_, i) => Hourlyitem(
                  hour: city.forecast.forecastday[0].hour[i],
                  isNow:
                      DateTime.now().hour ==
                          DateTime.parse(
                            city.forecast.forecastday[0].hour[i].time,
                          ).hour &&
                      DateTime.now().day ==
                          DateTime.parse(
                            city.forecast.forecastday[0].hour[i].time,
                          ).day &&
                      DateTime.now().month ==
                          DateTime.parse(
                            city.forecast.forecastday[0].hour[i].time,
                          ).month,
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemCount: city.forecast.forecastday[0].hour.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
