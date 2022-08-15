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
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(
                              child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )),
                        )),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd("en_US")
                          .add_jm()
                          .format(transactions[index].date),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}



                // return Card(
                //   margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                //   elevation: 5,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(15.0),
                  // ),
                //   child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Expanded(
                //           flex: 4,
                //           child: Container(
                //             decoration: BoxDecoration(
                //               color: Theme.of(context).primaryColorDark,
                //               border: Border.all(
                //                   color: Theme.of(context).primaryColorDark),
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             margin: const EdgeInsets.symmetric(
                //                 vertical: 10, horizontal: 10),
                //             padding: const EdgeInsets.all(10),
                //             child: Text(
                //               "\$${transactions[index].amount.toStringAsFixed(2)}",
                              // style: const TextStyle(
                              //     fontWeight: FontWeight.bold,
                              //     fontSize: 18,
                              //     color: Colors.white),
                //             ),
                //           ),
                //         ),
                //         Expanded(
                //           flex: 5,
                //           child: Padding(
                //             padding: const EdgeInsets.all(10.0),
                //             child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text(
                //                     transactions[index].title,
                                    // style:
                                    //     Theme.of(context).textTheme.headline6,
                //                   ),
                //                   Text(
                                      // DateFormat.yMMMd("en_US")
                                      //     .add_jm()
                                      //     .format(transactions[index].date),
                //                       style: const TextStyle(
                //                           color: Colors.grey, fontSize: 10)),
                //                 ]),
                //           ),
                //         )
                //       ]),
                // );