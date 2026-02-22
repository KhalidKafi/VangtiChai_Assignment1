// Widget to show notes and count
import 'package:flutter/material.dart';

class ChangeTable extends StatelessWidget {
  final Map<int, int> change;
  final bool twoColumns;

  const ChangeTable({
    super.key,
    required this.change,
    this.twoColumns = false,
  });

  @override
  Widget build(BuildContext context) {
    List<MapEntry<int, int>> rows = change.entries.toList();
    if (!twoColumns) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: rows.map(makeRow).toList(),
      );
    }

    int half = (rows.length / 2).ceil();
    List<MapEntry<int, int>> leftSide = rows.sublist(0, half);
    List<MapEntry<int, int>> rightSide = rows.sublist(half);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: ListView(children: leftSide.map(makeRow).toList()),
          ),
          Expanded(
            child: ListView(children: rightSide.map(makeRow).toList()),
          ),
        ],
      ),
    );
  }

  Widget makeRow(MapEntry<int, int> rowData) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: Text(
              rowData.key.toString(),
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            ':',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          Text(
            rowData.value.toString(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
