import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTrasaction extends StatefulWidget {
  final Function newTrans;

  NewTrasaction(this.newTrans);

  @override
  _NewTrasactionState createState() => _NewTrasactionState();
}

class _NewTrasactionState extends State<NewTrasaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || newDate == null) {
      return;
    }
    widget.newTrans(
      enteredTitle,
      enteredAmount,
      newDate,
    );
    Navigator.of(context).pop();
  }

  DateTime newDate;

  void _presentDatePiker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        newDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submit,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submit,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(newDate == null
                      ? "No Date chosen"
                      : DateFormat.yMMMMEEEEd().format(newDate)),
                ),
                TextButton(
                  onPressed: _presentDatePiker,
                  child: Text(
                    "Chose date",
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: submit,
              child: Text(
                "Add transaction",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(onPrimary: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
