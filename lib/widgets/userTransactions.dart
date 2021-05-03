import 'package:flutter/material.dart';
import '../widgets/newTransaction.dart';
import '../widgets/transactionList.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTrasaction(),
        TransactionList(),
      ],
    );
  }
}
