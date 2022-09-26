import 'package:flutter/material.dart';
import 'package:weatherApp/ClassApp/Transaction.dart';
import 'package:weatherApp/ClassApp/TransactionList_Class7.dart';

class ClassApp_7 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}
class _AppState extends State<ClassApp_7> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();

  void _insertTransaction() {
    if(_transaction.content.isEmpty || _transaction.amount == 0.0 || _transaction.amount.isNaN) {
      return;
    }
    _transaction.createDate = DateTime.now();
    _transactions.add(_transaction);
    _transaction = Transaction(content: '', amount: 0.0);
    _contentController.text = '';
    _amountController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "This is a StatefulWidget",
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Transaction manager'),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.picture_as_pdf),
                    onPressed: () {
                      this._insertTransaction();
                    })
              ],
            ),
            floatingActionButton: FloatingActionButton(
              tooltip: 'Add transaction',
              child: Icon(Icons.baby_changing_station_rounded),
              onPressed: () {
                setState(() {
                  _insertTransaction();
                });
              },
            ),
            key: _scaffoldKey,
            body: SafeArea(
                minimum: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(labelText: 'Content'),
                        controller: _contentController,
                        onChanged: (text) {
                          setState(() {
                            _transaction.content = text;
                          });
                        },
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: 'Amount(money)'),
                        controller: _amountController,
                        onChanged: (value) {
                          setState(() {
                            _transaction.amount = double.tryParse(value) ?? 0;
                          });
                        },
                      ),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 20)),
                      ButtonTheme(
                        height: 50,
                        child:
                        FlatButton(onPressed: () {
                          setState(() {
                            _insertTransaction();
                          });
                          //print('Content = $_content, money\'s amount = $_amount');
                          // Scaffold.of(context).showSnackBar(
                          //     SnackBar(content: Text('Content = $_content, money\'s amount = $_amount'))
                          // );
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(
                                content:
                                // Text(
                                //     'Content = ${_transaction.content}, money\'s amount = ${_transaction.amount}'
                                // ),
                                Text(
                                    'transaction list : '+ _transactions.toString()
                                ),
                                duration: Duration(seconds: 3),
                              )
                          );
                        }, child: Text('Insert Transaction', style: const TextStyle(fontSize: 18),),
                            color: Colors.pinkAccent,
                            textColor: Colors.white
                        ),
                      ),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 20)),
                      TransactionList_Class7(transactions: _transactions,)
                    ],
                  ),
                )
            )
        )
    );
  }
}