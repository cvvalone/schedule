import 'package:flutter/material.dart';

class BaseEmptyView extends StatelessWidget {
  final String imagePath;
  final String title;

  const BaseEmptyView({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, width: 120, height: 120, fit: BoxFit.contain),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}