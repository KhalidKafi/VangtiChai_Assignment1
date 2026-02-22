// Main screen for VangtiChai app
import 'package:flutter/material.dart';
import '../models/change_calculator.dart';
import '../widgets/numeric_keypad.dart';
import '../widgets/change_table.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int money = 0;
  late Map<int, int> change;

  @override
  void initState() {
    super.initState();
    change = calculateChange(0);
  }

  void pressNumber(int number) {
    if (money.toString().length >= 8) return;
    setState(() {
      money = money * 10 + number;
      change = calculateChange(money);
    });
  }

  void pressClear() {
    setState(() {
      money = 0;
      change = calculateChange(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool phoneVertical = MediaQuery.of(context).orientation == Orientation.portrait;

    Widget topText = Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Center(
        child: Text(
          'Taka: ৳$money',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('VangtiChai')),
      body: Column(
        children: [
          topText,
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: phoneVertical
                  ? [
                      Expanded(child: ChangeTable(change: change)),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: NumericKeypad(
                              onDigit: pressNumber,
                              onClear: pressClear,
                              columns: 3,
                            ),
                          ),
                        ),
                      ),
                    ]
                  : [
                      Expanded(
                        flex: 3,
                        child: ChangeTable(
                          change: change,
                          twoColumns: true,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: NumericKeypad(
                            onDigit: pressNumber,
                            onClear: pressClear,
                            columns: 4,
                            scale: 1,
                          ),
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
