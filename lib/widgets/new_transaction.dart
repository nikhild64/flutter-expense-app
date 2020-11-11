import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  var amountController = TextEditingController();
  final Function addtran;
  NewTransaction(this.addtran);

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
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            FlatButton(
                onPressed: () {
                  addtran(titleController.text,
                      double.parse(amountController.text));
                },
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.purple),
                  textAlign: TextAlign.left,
                ))
          ],
        ),
      ),
    );
  }
}
