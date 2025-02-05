import 'package:flutter/material.dart';
import 'package:schedule/src/utils/constants/colors.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RefreshButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.refresh, size: 48, color: ScheduleColors.sBgColor),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: onPressed,
            child: const Text("Повторити спробу"),
          ),
        ],
      ),
    );
  }
}