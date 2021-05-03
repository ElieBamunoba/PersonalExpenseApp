import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "t1", title: "Shoes", amount: 10.20, date: DateTime.now()),
    Transaction(id: "t2", title: "Shirt", amount: 50.9, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map(
        (tx) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "\$ ${tx.amount}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(tx.date),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
