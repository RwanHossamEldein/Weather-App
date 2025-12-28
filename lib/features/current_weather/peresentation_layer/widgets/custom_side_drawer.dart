import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/Themes/themes_cubit.dart';
import 'package:weather_app/features/Themes/themes_state.dart';

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
                    'Settings',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.language,
                    color: state.isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    'Language',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    state.isDark ? Icons.dark_mode : Icons.light_mode,
                    color: state.isDark ? Colors.white : Colors.black,
                  ),
                  title: Text(
                    state.isDark ? 'Dark Mode' : 'Light Mode',
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
