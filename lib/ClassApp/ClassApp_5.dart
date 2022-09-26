import 'package:flutter/material.dart';
import 'package:weatherApp/ClassApp/Transaction.dart';

class ClassApp_5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}
class _AppState extends State<ClassApp_5> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();

  Transaction _transaction = Transaction(content: '', amount: 0.0);
  List<Transaction> _transactions = List<Transaction>();

  @override
  Widget build(BuildContext context) {

    List<Widget> _buildWidgetList() {
      int index = 0;
     return _transactions.map((eachTransaction) {
       index ++;
        return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
            elevation: 10,
            color: (index - 1) % 2 == 0 ? Colors.pink : Colors.blue,
            child: ListTile(
              title: Text(eachTransaction.content, style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18)),
              subtitle: Text('this is price: ${eachTransaction.amount}'),
              leading: const Icon(Icons.accessible_forward),
              onLongPress: () {
                print('long pressed');
              },
            )
        );
      }).toList();
    }

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
                        _transaction = Transaction(content: '', amount: 0.0);
                        _contentController.text = '';
                        _amountController.text = '';
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
                  Column(children: _buildWidgetList(),
                  )
                ],
              ),
            )
        )
    );
  }
}