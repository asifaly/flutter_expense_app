import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({required this.transactions, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          elevation: 5,
          child: Row(children: [
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.purple)),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              padding: const EdgeInsets.all(10),
              child: Text(
                "\$${tx.amount.toString()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(tx.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Text(DateFormat.yMMMd("en_US").add_jm().format(tx.date),
                  style: const TextStyle(color: Colors.grey, fontSize: 10)),
            ])
          ]),
        );
      }).toList(),
    );
  }
}
