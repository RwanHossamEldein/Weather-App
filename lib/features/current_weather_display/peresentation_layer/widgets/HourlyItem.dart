import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';

class Hourlyitem extends StatelessWidget {
  final Hour hour;
  final bool isNow;
  const Hourlyitem({super.key, required this.hour, required this.isNow});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 70,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isNow
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hour.time.split(' ').last,
            style: TextStyle(color: isNow ? Colors.white : Colors.grey),
          ),

          Image.network('https:${hour.condition.icon}', width: 28),
          Text(
            '${hour.tempC.round()}°',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: isNow ? Colors.white : ColorsApp.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
