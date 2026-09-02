import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class AmountDisplay extends StatelessWidget {
  final int amount;

  const AmountDisplay({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.amountVerticalPadding,
      ),
      child: Text(
        'Taka: $amount',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: AppSizes.amountTextSize,
          color: Colors.black87,
        ),
      ),
    );
  }
}
