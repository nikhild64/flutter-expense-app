import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtran;
  NewTransaction(this.addtran);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  var amountController = TextEditingController();
  var userDate;

  void submitData() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0 ||
        userDate == null) {
      return;
    }
    this.widget.addtran(
        titleController.text, double.parse(amountController.text), userDate);
  }

  void _pickDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      setState(() {
        userDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) {
                submitData();
              },
            ),
            TextField(
              onSubmitted: (_) {
                submitData();
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(userDate == null
                      ? 'No Date Choosen'
                      : DateFormat().add_yMMMd().format((userDate))),
                  FlatButton(
                      onPressed: _pickDate,
                      child: Text('Pick Date',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          )))
                ],
              ),
            ),
            RaisedButton(
                onPressed: submitData,
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
