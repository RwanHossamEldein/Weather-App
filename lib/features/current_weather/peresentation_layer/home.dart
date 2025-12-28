import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/cubit/current_weather_cubit.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/cubit/current_weather_state.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/widgets/custom_add_to_saved_button.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/widgets/custom_current_location_card.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/widgets/custom_search_bar.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/widgets/custom_side_drawer.dart';
import 'package:weather_app/features/current_weather/peresentation_layer/widgets/saved_location_card.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<CurrentWeatherCubit>().loadInitialWeather('Alexandria');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: CustomSideDrawer(),

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<CurrentWeatherCubit, CurrentWeatherState>(
            builder: (context, state) {
              if (state is CurrentWeatherLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is CurrentWeatherError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              if (state is CurrentWeatherLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Locations',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        TextButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },

                          child: Text(
                            'Edit',
                            style: TextStyle(color: ColorsApp.primaryColor),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Search Bar
                    CustomSearchBar(controller: _searchController),

                    const SizedBox(height: 20),

                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Current
                            const Text(
                              'Current',
                              style: TextStyle(
                                color: Color.fromARGB(255, 141, 172, 187),
                              ),
                            ),
                            const SizedBox(height: 10),

                            CustomCurrentLocationCard(
                              weather: state.currentWeather,
                            ),

                            const SizedBox(height: 24),

                            // Saved
                            const Text(
                              'SAVED LOCATIONS',
                              style: TextStyle(
                                color: Color.fromARGB(255, 141, 172, 187),
                              ),
                            ),
                            const SizedBox(height: 10),

                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.savedLocations.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: SavedLocationCard(
                                    weather: state.savedLocations[index],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Add Button
                    Center(
                      child: CustomAddToSavedButton(
                        onPressed: () {
                          final city = _searchController.text.trim();
                          if (city.isNotEmpty) {
                            context
                                .read<CurrentWeatherCubit>()
                                .addSavedLocation(city);
                            _searchController.clear();
                            FocusScope.of(context).unfocus();
                          }
                        },
                      ),
                    ),
                  ],
                );
              }

              return const Center(
                child: Text(
                  'Search for a city to start',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
