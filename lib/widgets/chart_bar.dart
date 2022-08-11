import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;
  const ChartBar(
      {required this.label,
      required this.spendingAmount,
      required this.spendingPctOfTotal,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('\$${spendingAmount.toStringAsFixed(0)}'),
      const SizedBox(
        height: 4,
      ),
      SizedBox(
        height: 60,
        width: 10,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(20)),
          ),
          FractionallySizedBox(
              heightFactor: spendingPctOfTotal,
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Colors.grey, width: 1.0))))
        ]),
      )
    ]);
  }
}
