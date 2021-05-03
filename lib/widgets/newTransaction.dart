import 'package:flutter/material.dart';

class NewTrasaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              keyboardType: TextInputType.number,
              controller: amountController,
            ),
            FlatButton(
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.purple, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
