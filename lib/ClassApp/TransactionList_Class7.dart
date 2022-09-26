import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherApp/ClassApp/Transaction.dart';

class TransactionList_Class7 extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList_Class7({this.transactions});

  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              color: (index - 1) % 2 == 0 ? Colors.yellow : Colors.blueGrey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Text(transactions[index].content,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.redAccent)),
                      Text(
                          'Date: ${DateFormat.yMd().format(transactions[index].createDate)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.green)),
                      Padding(padding: EdgeInsets.only(bottom: 10)),
                    ],
                  ),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(': ${transactions[index].amount}\£',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.green)
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 5, style: BorderStyle.solid),
                          borderRadius: BorderRadius.all(Radius.circular(19))
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10),)
                    ],
                  )),
                ],
              ),
              //TODO: Let this code here as a sample
              // ListTile(
              //   title: Text(transactions[index].content, style: TextStyle(
              //       fontWeight: FontWeight.bold, fontSize: 18)),
              //   subtitle: Text('this is price: ${transactions[index].amount}'),
              //   leading: const Icon(Icons.accessible_forward),
              //   onLongPress: () {
              //     print('long pressed');
              //   },
              // )
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: this._buildListView(),
    );
  }
}
