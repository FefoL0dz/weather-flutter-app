import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weatherApp/ClassApp/Transaction.dart';
import 'file:///C:/Users/felip/Desktop/Projetos/weather-flutter-app/lib/ClassApp/TransactionList.dart';
import 'package:weatherApp/ClassApp/TransactionList_Class7.dart';


class ClassApp_9 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<ClassApp_9> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();

  void _insertTransaction() {
    if (_transaction.content.isEmpty ||
        _transaction.amount == 0.0 ||
        _transaction.amount.isNaN) {
      return;
    }
    _transaction.createDate = DateTime.now();
    _transactions.add(_transaction);
    _transaction = Transaction(content: '', amount: 0.0);
    _contentController.text = '';
    _amountController.text = '';
  }

  void _onButtonShowModalSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Content'),
                    controller: _contentController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.content = text;
                      });
                    },
                  )),
              Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    decoration: InputDecoration(labelText: 'Amount(money)'),
                    controller: _amountController,
                    onChanged: (value) {
                      setState(() {
                        _transaction.amount = double.tryParse(value) ?? 0;
                      });
                    },
                  )),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                        child: SizedBox(
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                this._insertTransaction();
                              });
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'save',
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                            color: Colors.red,
                          ),
                          height: 50,
                        )),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                        child: SizedBox(
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text(
                              'cancel',
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                            color: Colors.black,
                          ),
                          height: 50,
                        )),
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transaction manager',
            style: const TextStyle(
                fontSize: 18,
              fontFamily: 'Bonbon'
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.picture_as_pdf),
                color: Theme.of(context).accentColor ,
                onPressed: () {
                  this._onButtonShowModalSheet();
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add transaction',
          child: Icon(Icons.baby_changing_station_rounded),
          backgroundColor: Random.secure().nextInt(9) % 2 == 0 ? Theme.of(context).primaryColor : Colors.green,
          onPressed: () {
            setState(() {
              this._onButtonShowModalSheet();
            });
          },
        ),
        key: _scaffoldKey,
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: const EdgeInsets.symmetric(vertical: 20)),
                  ButtonTheme(
                    height: 50,
                    child: FlatButton(
                        onPressed: () {
                          this._onButtonShowModalSheet();
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('transaction list : ' +
                                _transactions.toString()),
                            duration: Duration(seconds: 3),
                          ));
                        },
                        child: Text(
                          'Insert Transaction',
                          style: const TextStyle(fontSize: 18),
                        ),
                        color: Colors.pinkAccent,
                        textColor: Colors.white),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(vertical: 20)),
                  TransactionList_Class7(
                    transactions: _transactions,
                  )
                ],
              ),
            )));
  }
}
