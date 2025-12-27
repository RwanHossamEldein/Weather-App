import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';
import 'package:weather_app/features/current_weather_display/peresentation_layer/widgets/info_card.dart';
import 'package:weather_app/features/current_weather_display/peresentation_layer/widgets/top_app_bar.dart';

// ignore: must_be_immutable
class CurrentWeatherDisplayScreen extends StatelessWidget {
  Model city;
  CurrentWeatherDisplayScreen({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backgroundDark,
      body: Column(
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
                title: 'Wind',
                value: '${city.current.windKph} kph',
              ),
              InfoCard(
                icon: Icons.water_drop,
                title: 'Humidity',
                value: '${city.current.humidity}%',
              ),
              InfoCard(
                icon: Icons.cloud,
                title: 'Rain',
                value: '${city.forecast.forecastday[0].day.dailyChanceOfRain}%',
              ),
              InfoCard(
                icon: Icons.sunny,
                title: 'UV INDEX',
                value: '${city.current.uv.toString()}%',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
