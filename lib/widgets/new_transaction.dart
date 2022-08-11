import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;
  NewTransaction({required this.addTransaction, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
                addTransaction(
                    titleController.text, double.parse(amountController.text));
              },
              // debugPrint(titleController.text);
              // debugPrint(amountController.text);
              textColor: Colors.purple,
              child: const Text('Add Transaction'))
        ]),
      ),
    );
  }
}
