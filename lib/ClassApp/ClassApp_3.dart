import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClassApp_3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}
class _AppState extends State<ClassApp_3> {
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
final _contentController = TextEditingController();
final _amountController = TextEditingController();
String _content;
double _amount;
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
                       _content = text;
                     });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount(money)'),
                    controller: _amountController,
                    onChanged: (value) {
                      setState(() {
                        _amount = double.tryParse(value) ?? 0;
                      });
                    },
                  ),
                  FlatButton(onPressed: () {
                    print('Content = $_content, money\'s amount = $_amount');
                    // Scaffold.of(context).showSnackBar(
                    //     SnackBar(content: Text('Content = $_content, money\'s amount = $_amount'))
                    // );
                    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Content = $_content, money\'s amount = $_amount'),
                    duration: Duration(seconds: 3),
                    )
                    );
                  }, child: Text('Insert Transaction'),
                      color: Colors.black,
                      textColor: Colors.pinkAccent)
                ],
              ),
            )
        )
    );
  }
}