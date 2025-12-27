import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';

// ignore: must_be_immutable
class TopAppBar extends StatelessWidget {
  Model city;
  TopAppBar({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, right: 16, left: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: ColorsApp.backgroundLight,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Column(
            children: [
              Center(
                child: Text(
                  city.location.name,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: ColorsApp.backgroundLight,
                  ),
                ),
              ),
              const SizedBox(height: 4),

              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                'Live Updates',
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(color: Colors.grey),
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.location_on)),
        ],
      ),
    );
  }
}
