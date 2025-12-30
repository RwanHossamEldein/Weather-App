import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/colors_app.dart';
import 'package:weather_app/features/search/peresentation_layer/state_management/search_cubit.dart';
import 'package:weather_app/features/search/peresentation_layer/state_management/search_state.dart';
import 'package:weather_app/l10n/app_localizations.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onCitySelected,
  });

  final TextEditingController controller;
  final Function(String cityName) onCitySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(color: ColorsApp.backgroundLight),
          controller: controller,
          onChanged: (value) {
            context.read<SearchCubit>().searchCity(value);
          },
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.findCityOrAirport,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
          ),
        ),
        const SizedBox(height: 5),

        BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              );
            } else if (state is SearchLoaded) {
              final results = state.results;
              if (results.isEmpty) {
                return const SizedBox.shrink();
              }
              return ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 300),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final city = results[index];
                    return ListTile(
                      title: Text(city.location.name),
                      subtitle: Text(
                        '${city.location.region}, ${city.location.country}',
                      ),
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        onCitySelected(city.name);
                      },
                    );
                  },
                ),
              );
            } else if (state is SearchError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
