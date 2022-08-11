import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'new phone', amount: 99.99, date: DateTime.now()),
  ];
  // String titleInput = "";
  // String amountInput = "";
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses App'),
        ),
        body: Column(
          children: [
            const Card(
              color: Colors.blue,
              elevation: 5,
              child: SizedBox(width: double.infinity, child: Text('CHART')),
            ),
            Card(
              elevation: 5,
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextField(
                        decoration: const InputDecoration(labelText: 'Title'),
                        controller: titleController,
                        // onChanged: (value) {
                        //   titleInput = value;
                        // }
                      ),
                      TextField(
                        decoration: const InputDecoration(labelText: 'Amount'),
                        controller: amountController,
                        // onChanged: (value) {
                        //   amountInput = value;
                        // }
                      ),
                      FlatButton(
                          onPressed: () {
                            debugPrint(titleController.text);
                            debugPrint(amountController.text);
                          },
                          textColor: Colors.purple,
                          child: const Text('Add Transaction'))
                    ]),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  elevation: 5,
                  child: Row(children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple)),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "\$${tx.amount.toString()}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(tx.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                              DateFormat.yMMMd("en_US")
                                  .add_jm()
                                  .format(tx.date),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 10)),
                        ])
                  ]),
                );
              }).toList(),
            ),
          ],
        ));
  }
}
