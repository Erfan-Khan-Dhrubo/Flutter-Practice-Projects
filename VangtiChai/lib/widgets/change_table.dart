import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../utils/change_calculator.dart';

class ChangeTable extends StatelessWidget {
  final Map<int, int> noteCounts;
  final bool isLandscape;

  const ChangeTable({
    super.key,
    required this.noteCounts,
    this.isLandscape = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLandscape) {
      return _buildTwoColumnLayout();
    }
    return _buildSingleColumnLayout();
  }

  /// Portrait
  Widget _buildSingleColumnLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.panelSpacing),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: ChangeCalculator.denominations.map((int note) {
          return _buildNoteLine(note);
        }).toList(),
      ),
    );
  }

  /// Landscape
  Widget _buildTwoColumnLayout() {
    final List<int> leftNotes = ChangeCalculator.denominations.sublist(0, 4);
    final List<int> rightNotes = ChangeCalculator.denominations.sublist(4);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.panelSpacing),
      child: Row(
        children: [
          Expanded(child: _buildNoteColumn(leftNotes)),
          Expanded(child: _buildNoteColumn(rightNotes)),
        ],
      ),
    );
  }

  Widget _buildNoteColumn(List<int> notes) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: notes.map((int note) => _buildNoteLine(note)).toList(),
    );
  }

  Widget _buildNoteLine(int note) {
    final int count = noteCounts[note] ?? 0;
    return Text(
      '$note: $count',
      style: const TextStyle(
        fontSize: AppSizes.noteTextSize,
        color: Colors.black87,
      ),
    );
  }
}
