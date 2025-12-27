import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';

// ignore: must_be_immutable
class LocationSection extends StatelessWidget {
  Model city;
  LocationSection({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${city.location.name}, ${city.location.country}",

          style: TextStyle(
            color: ColorsApp.backgroundLight,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          city.current.lastUpdated,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
