import 'package:flutter/material.dart';
import 'package:weather_app/core/colors_app.dart';

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? subtitle;

  const InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFF1E2832),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: ColorsApp.backgroundLight,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 179, 180, 182),
            ),
          ),
          if (subtitle != null)
            Text(subtitle!, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
