import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../utils/change_calculator.dart';
import '../widgets/amount_display.dart';
import '../widgets/change_table.dart';
import '../widgets/numeric_keypad.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _amount = 0;

  Map<int, int> _noteCounts = ChangeCalculator.calculateChange(0);

  void _onDigitPressed(int digit) {

    if (_amount.toString().length >= AppSizes.maxAmountDigits) {
      return;
    }

    setState(() {
      _amount = (_amount * 10) + digit;
      _noteCounts = ChangeCalculator.calculateChange(_amount);
    });
  }

  void _onClearPressed() {
    setState(() {
      _amount = 0;
      _noteCounts = ChangeCalculator.calculateChange(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('VangtiChai'),
        centerTitle: false,
        elevation: 4,
      ),

      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.landscape) {
            return _buildLandscapeLayout();
          }
          return _buildPortraitLayout();
        },
      ),
    );
  }


  Widget _buildPortraitLayout() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.screenPadding),
      child: Column(
        children: [
          AmountDisplay(amount: _amount),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: ChangeTable(
                    noteCounts: _noteCounts,
                    isLandscape: false,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: NumericKeypad(
                    onDigitPressed: _onDigitPressed,
                    onClearPressed: _onClearPressed,
                    isLandscape: false,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildLandscapeLayout() {
    return Padding(
      padding: const EdgeInsets.all(AppSizes.screenPadding),
      child: Column(
        children: [
          AmountDisplay(amount: _amount),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: ChangeTable(
                    noteCounts: _noteCounts,
                    isLandscape: true,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: NumericKeypad(
                    onDigitPressed: _onDigitPressed,
                    onClearPressed: _onClearPressed,
                    isLandscape: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
