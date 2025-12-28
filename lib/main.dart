import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/Themes/themes_cubit.dart';
import 'package:weather_app/features/Themes/themes_state.dart';
import 'package:weather_app/features/current_weather/data_layer/data_source.dart';
import 'package:weather_app/features/current_weather/data_layer/repo.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/cubit/current_weather_cubit.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/home.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CurrentWeatherCubit(CurrentRepoImp(CurrentRemoteDataSourceImp())),
        ),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: ColorsApp.primaryColor,
            scaffoldBackgroundColor: const Color(0xFFF0F4F8),
            cardColor: Colors.white,
            shadowColor: Colors.grey.withOpacity(0.2),
            iconTheme: const IconThemeData(color: Colors.black87),
            textTheme: const TextTheme(
              headlineLarge: TextStyle(
                color: ColorsApp.backgroundDark,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: TextStyle(
                color: ColorsApp.backgroundDark,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                color: ColorsApp.backgroundDark,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                color: ColorsApp.backgroundDark,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: ColorsApp.primaryColor,
            scaffoldBackgroundColor: ColorsApp.backgroundDark,
            textTheme: const TextTheme(
              headlineLarge: TextStyle(
                color: ColorsApp.backgroundLight,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              headlineMedium: TextStyle(
                color: ColorsApp.backgroundLight,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              headlineSmall: TextStyle(
                color: ColorsApp.backgroundLight,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                color: ColorsApp.backgroundLight,
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            cardColor: ColorsApp.filledColor,
            iconTheme: const IconThemeData(color: ColorsApp.backgroundLight),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsApp.filledColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
          home: Screen(),
        );
      },
    );
  }
}
