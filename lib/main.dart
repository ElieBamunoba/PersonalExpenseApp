import 'package:flutter/material.dart';

import './models/transactions.dart';
import './widgets/transactionList.dart';
import './widgets/newTransaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "t1", title: "Shoes", amount: 10.20, date: DateTime.now()),
    Transaction(id: "t2", title: "Shirt", amount: 50.9, date: DateTime.now()),
  ];
  void _addNewTransaction(String titleText, double amountText) {
    final newTras = Transaction(
      id: DateTime.now().toString(),
      title: titleText,
      amount: amountText,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTras);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTrasaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personal Expense"),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context))
          ],
        ),
        body: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              child: Card(
                color: Colors.blue,
                child: Text("Chart!"),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ),
    );
  }
}
