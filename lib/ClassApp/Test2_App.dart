import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Test2_App extends StatefulWidget {
  String name;
  int age;
  Test2_App({this.name, this.age});
  @override
  State<StatefulWidget> createState() {
    return _TestAppState();
  }
}
class _TestAppState extends State<Test2_App> with WidgetsBindingObserver {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('Run initState()');
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    print('Run dispose()');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.paused) {
      print('App is in Background mode');
    } else if(state == AppLifecycleState.resumed) {
      print('App is in Foreground mode');
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime someDate = new DateTime(2021, 1, 7);
    return MaterialApp(
        title: "This is a StatefulWidget",
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  DateFormat('yyyy/MM/dd').format(now),
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
                Text(
                  DateFormat.yMMMd().format(now),
                  style: TextStyle(fontSize: 25, color: Colors.green),
                ),
                Text(
                  someDate.toString(),
                  style: TextStyle(fontSize: 25, color: Colors.green),
                ),
                Text(
                  NumberFormat('###.0###', 'pt_BR').format(12.3465656),
                  style: TextStyle(fontSize: 25, color: Colors.green),
                ),
              ],
            ),
          ),
        )
    );
  }
}