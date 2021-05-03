import 'package:flutter/material.dart';

import './models/transactions.dart';
import './widgets/transactionList.dart';

//https://github.com/ElieBamunoba/PersonalExpenseApp.git
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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personal Expense"),
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
            TransactionList(),
          ],
        ),
      ),
    );
  }
}
