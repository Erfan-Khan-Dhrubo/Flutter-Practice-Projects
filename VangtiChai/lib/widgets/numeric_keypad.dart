import 'package:flutter/material.dart';

import 'number_button.dart';

class NumericKeypad extends StatelessWidget {
  final void Function(int digit) onDigitPressed;
  final VoidCallback onClearPressed;
  final bool isLandscape;

  const NumericKeypad({
    super.key,
    required this.onDigitPressed,
    required this.onClearPressed,
    this.isLandscape = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLandscape) {
      return _buildLandscapeKeypad();
    }
    return _buildPortraitKeypad();
  }

  Widget _buildPortraitKeypad() {
    return Column(
      children: [
        Expanded(child: _buildDigitRow(const [1, 2, 3])),
        Expanded(child: _buildDigitRow(const [4, 5, 6])),
        Expanded(child: _buildDigitRow(const [7, 8, 9])),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _digitButton(0)),
              Expanded(flex: 2, child: _clearButton()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeKeypad() {
    return Column(
      children: [
        Expanded(child: _buildDigitRow(const [1, 2, 3, 4])),
        Expanded(child: _buildDigitRow(const [5, 6, 7, 8])),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _digitButton(9)),
              Expanded(child: _digitButton(0)),
              Expanded(flex: 2, child: _clearButton()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDigitRow(List<int> digits) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: digits.map((int digit) {
        return Expanded(child: _digitButton(digit));
      }).toList(),
    );
  }

  Widget _digitButton(int digit) {
    return NumberButton(
      label: '$digit',
      onPressed: () => onDigitPressed(digit),
    );
  }

  Widget _clearButton() {
    return NumberButton(
      label: 'CLEAR',
      onPressed: onClearPressed,
    );
  }
}
