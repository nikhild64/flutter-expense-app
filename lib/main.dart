import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.blueGrey,
      ),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _starttNexTx(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (blctx) {
          return NewTransaction(_addTransaction);
        });
  }

  final List<TransactionData> _transactions = [
    /* TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()), */
  ];
  void _addTransaction(String txTitle, double txAmount) {
    final newTx = TransactionData(
      title: txTitle,
      amount: txAmount,
      transactionDate: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTx);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _starttNexTx(context);
          }),
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _starttNexTx(context);
              })
        ],
        title: Text('Expense Tracker'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.amberAccent,
                child: Text(
                  'Chart!',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
    );
  }
}
