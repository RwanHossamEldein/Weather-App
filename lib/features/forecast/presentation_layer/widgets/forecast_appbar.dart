import 'package:flutter/material.dart';
import 'package:weather_app/l10n/app_localizations.dart';

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
          //
          Text(
            AppLocalizations.of(context)!.threeDayForecast,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
