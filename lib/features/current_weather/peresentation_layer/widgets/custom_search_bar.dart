import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: ColorsApp.backgroundLight),
      controller: controller,

      decoration: InputDecoration(
        hintText: 'Find city or airport',
        hintStyle: TextStyle(color: Colors.grey),

        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        filled: true,
        fillColor: const Color(0xFF1e2832),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
      ),
    );
  }
}
