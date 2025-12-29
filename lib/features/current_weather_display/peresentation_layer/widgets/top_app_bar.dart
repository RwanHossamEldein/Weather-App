import 'package:flutter/material.dart';
import 'package:weather_app/features/current_weather/data_layer/model.dart';
import 'package:weather_app/l10n/app_localizations.dart';

// ignore: must_be_immutable
class TopAppBar extends StatelessWidget {
  Model city;
  TopAppBar({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, right: 16, left: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).iconTheme.color,
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
                  style: Theme.of(context).textTheme.headlineLarge,
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
                AppLocalizations.of(context)!.liveUpdates,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.location_on)),
        ],
      ),
    );
  }
}
