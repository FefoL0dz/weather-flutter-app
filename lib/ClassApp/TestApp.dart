import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  String name;
  int age;
  TestApp({this.name, this.age});
  @override
  State<StatefulWidget> createState() {
    return _TestAppState();
  }
}
  class _TestAppState extends State<TestApp> with WidgetsBindingObserver {
  String _email = '';
  final emailEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    print('Run initState()');
  }

  @override
  void dispose() {
    super.dispose();
    emailEditingController.dispose();
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
      return MaterialApp(
      title: "This is a StatefulWidget",
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  controller: emailEditingController,
                  onChanged: (text) {
                    this.setState(() {
                      _email = text;
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(20)
                        ),
                      ),
                      labelText: 'Enter your email'
                  ),
                ),
              ),
              Text(
                'Name = ${widget.name}, age = ${widget.age}',
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),
              Text(
                'Name = ${widget.name}, age = ${widget.age}',
                style: TextStyle(fontSize: 30, color: Colors.green),
              ),
              Text(
                _email,
                style: TextStyle(fontSize: 30, color: Colors.blue),
              )
            ],
          ),
        ),
      )
      );
    }
  }