import 'package:flutter/material.dart';
import 'menu_grid.dart';

class CustomPage extends StatelessWidget {
  final String title;
  
  const CustomPage({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header dengan judul halaman
        Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).colorScheme.primary,
          child: Row(
            children: [
              Icon(
                Icons.menu,
                color: Colors.white,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        // Grid menu
        Expanded(
          child: MenuGrid(),
        ),
      ],
    );
  }
}