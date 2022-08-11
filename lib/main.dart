import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expenses App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              Card(
                color: Colors.blue,
                elevation: 5,
                child: SizedBox(width: double.infinity, child: Text('CHART')),
              ),
              UserTransactions(),
            ],
          ),
        ));
  }
}
