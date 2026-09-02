import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class NumberButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const NumberButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.buttonSpacing / 2),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade300,
          foregroundColor: Colors.black87,
          elevation: 2,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonBorderRadius),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: AppSizes.keypadTextSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
