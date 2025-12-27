import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';

class ForecastAppBar extends StatelessWidget {
  const ForecastAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
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
          const Spacer(),
          Text(
            "3-Day Forecast",
            style: TextStyle(
              color: ColorsApp.backgroundLight,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
