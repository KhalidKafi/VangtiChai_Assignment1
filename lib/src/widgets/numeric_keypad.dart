// Number buttons widget
import 'package:flutter/material.dart';

class NumericKeypad extends StatelessWidget {
  final Function(int) onDigit;
  final VoidCallback onClear;
  final int columns;
  final double scale;

  const NumericKeypad({
    super.key,
    required this.onDigit,
    required this.onClear,
    this.columns = 3,
    this.scale = 1.1,
  });

  @override
  Widget build(BuildContext context) {
    List<String> buttonTexts = [
      for (int num = 1; num <= 9; num++) num.toString(),
      '0',
      'CLEAR',
    ];

    List<List<String>> buttonRows = [];
    for (int start = 0; start < buttonTexts.length; start += columns) {
      int finish = start + columns;
      buttonRows.add(buttonTexts.sublist(start, finish > buttonTexts.length ? buttonTexts.length : finish));
    }

    return Transform.scale(
      scale: scale,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (List<String> row in buttonRows)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (String text in row)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: makeButton(text),
                        ),
                      ),
                    if (row.length < columns)
                      for (int empty = 0; empty < columns - row.length; empty++)
                        const Expanded(child: SizedBox.shrink()),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget makeButton(String text) {
    return ElevatedButton(
      onPressed: text == 'CLEAR' ? onClear : () => onDigit(int.parse(text)),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.grey.shade200,
        foregroundColor: Colors.black,
        elevation: 4,
        shadowColor: Colors.black45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(text, style: const TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
