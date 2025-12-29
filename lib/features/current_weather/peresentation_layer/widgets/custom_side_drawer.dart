import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/Themes/themes_cubit.dart';
import 'package:weather_app/features/Themes/themes_state.dart';
import 'package:weather_app/features/localization/localization_cubit.dart';
import 'package:weather_app/l10n/app_localizations.dart';

class CustomSideDrawer extends StatelessWidget {
  const CustomSideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Container(
            color: Theme.of(context).cardColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: ColorsApp.primaryColor),
                  child: Text(
                    AppLocalizations.of(context)!.settings,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: state.isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.language,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    final currentLang = context
                        .read<LocalizationCubit>()
                        .state
                        .language;
                    showDialog(
                      context: context,
                      builder: (context) {
                        String selectedLang = currentLang;
                        return AlertDialog(
                          title: Text(AppLocalizations.of(context)!.language),
                          content: StatefulBuilder(
                            builder: (context, setState) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  RadioListTile<String>(
                                    title: Text('English'),
                                    value: 'en',
                                    groupValue: selectedLang,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedLang = value!;
                                      });
                                    },
                                  ),
                                  RadioListTile<String>(
                                    title: Text('العربية'),
                                    value: 'ar',
                                    groupValue: selectedLang,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedLang = value!;
                                      });
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context
                                    .read<LocalizationCubit>()
                                    .toggleLanguage();
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    state.isDark ? Icons.dark_mode : Icons.light_mode,
                    color: state.isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    state.isDark
                        ? AppLocalizations.of(context)!.darkMode
                        : AppLocalizations.of(context)!.lightMode,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
