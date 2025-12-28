import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';

// ignore: must_be_immutable
class ForecastAppBar extends StatelessWidget {
  const ForecastAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const Spacer(),
          Text(
            "3-Day Forecast",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
