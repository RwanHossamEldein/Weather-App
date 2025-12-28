import 'package:flutter/material.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';
import 'package:weather_app/features/forecast/presentation_layer/screens/weekly_forcast.dart';

class SavedLocationCard extends StatelessWidget {
  final Model weather;
  const SavedLocationCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    String displayTime = weather.location.localtime.split(' ').last;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WeeklyForcast(city: weather)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        constraints: const BoxConstraints(minHeight: 80),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      weather.location.name,
                      style: Theme.of(context).textTheme.headlineMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      displayTime,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        'https:${weather.current.condition.icon}',
                        width: 35,
                        height: 35,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${weather.current.tempC.round()}°',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    weather.current.condition.text,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
