import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList({required this.transactions, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: transactions.isEmpty
          ? Column(children: [
              Text("No Transactions Yet",
                  style: Theme.of(context).textTheme.headline6),
              const SizedBox(height: 50),
              SizedBox(
                  height: 200, child: Image.asset('assets/images/waiting.png'))
            ])
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  child: Row(children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColorDark)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "\$${transactions[index].amount.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(
                              DateFormat.yMMMd("en_US")
                                  .add_jm()
                                  .format(transactions[index].date),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 10)),
                        ])
                  ]),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
