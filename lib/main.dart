import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/new_transaction.dart';
import 'widgets/user_transaction.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

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
        isScrollControlled: true,
        context: ctx,
        builder: (blctx) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: NewTransaction(_addTransaction),
          );
        });
  }

  final List<TransactionData> _transactions = [
    /*  TransactionData(
        amount: 10.99,
        id: DateTime.now().toString(),
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: DateTime.now().toString(),
        title: 'Shoes',
        transactionDate: DateTime.now()), */
  ];
  void _addTransaction(String txTitle, double txAmount, DateTime userDate) {
    final newTx = TransactionData(
      title: txTitle,
      amount: txAmount,
      transactionDate: userDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTx);
    });
    Navigator.of(context).pop();
  }

  void _deleteTransaction(id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
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
        child: GestureDetector(
          onVerticalDragDown: (_) {
            //Add gestures
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: double.infinity,
                  child: Card(
                    child: Chart(_transactions),
                  ),
                ),
              ),
              TransactionList(_transactions, _deleteTransaction),
            ],
          ),
        ),
      ),
    );
  }
}
