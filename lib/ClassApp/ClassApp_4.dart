import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherApp/ClassApp/Transaction.dart';

class ClassApp_4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}
class _AppState extends State<ClassApp_4> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "This is a StatefulWidget",
        home: Scaffold(
            key: _scaffoldKey,
            body: SafeArea(
              minimum: const EdgeInsets.only(left: 20, right: 20),
              child:
              Column(
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
                  Padding(padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  ButtonTheme(
                    height: 50,
                    child:
                    FlatButton(onPressed: () {
                      setState(() {
                        _transactions.add(_transaction);
                        _transaction.content = '';
                        _transaction.amount = 0.0;
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
                  Column(children: _transactions.map((eachTransaction) {
                    return ListTile(
                      title: Text('this is content: ${eachTransaction.content}'),
                      subtitle: Text('this is price: ${eachTransaction.amount}'),
                      leading: const Icon(Icons.access_alarm),
                      onLongPress: () {
                        print('long pressed');
                      },
                    );
                  }).toList(),
                  )
                ],
              ),
            )
        )
    );
  }
}