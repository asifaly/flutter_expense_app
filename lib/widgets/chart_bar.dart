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
      FittedBox(
          child: Text('\$${spendingAmount.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 10,
                fontFamily: 'Open Sans',
              ))),
      const SizedBox(
        height: 4,
      ),
      SizedBox(
        height: 70,
        width: 15,
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
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(20))))
        ]),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(label.toUpperCase(),
          style: const TextStyle(
            fontSize: 10,
            fontFamily: 'Open Sans',
          ))
    ]);
  }
}
