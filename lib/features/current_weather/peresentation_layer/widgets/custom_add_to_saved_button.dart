import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/cubit/current_weather_cubit.dart';
import 'package:weather_app/l10n/app_localizations.dart';

class CustomAddToSavedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomAddToSavedButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  final controller = TextEditingController();
                  return AlertDialog(
                    title: Text(AppLocalizations.of(context)!.addLocationTitle),
                    content: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.searchHint,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          final city = controller.text.trim();
                          if (city.isNotEmpty) {
                            context
                                .read<CurrentWeatherCubit>()
                                .addSavedLocation(city);
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  AppLocalizations.of(context)!.pleaseEnterCity,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.add),
                      ),
                    ],
                  );
                },
              );
            },
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_circle_outline, size: 20),
                SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.addNewLocation,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
