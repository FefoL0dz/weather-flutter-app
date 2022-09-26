import 'package:flutter/material.dart';
import 'package:weatherApp/ClassApp/Transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  ListView _buildListView() {
    return ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              elevation: 10,
              color: (index - 1) % 2 == 0 ? Colors.pink : Colors.blue,
              child: ListTile(
                title: Text(transactions[index].content, style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18)),
                subtitle: Text('this is price: ${transactions[index].amount}'),
                leading: const Icon(Icons.accessible_forward),
                onLongPress: () {
                  print('long pressed');
                },
              )
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: this._buildListView(),
    );
  }
  
}