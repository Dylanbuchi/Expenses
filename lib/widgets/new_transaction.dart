import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              cursorColor: Colors.green,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              //onChanged: (v) => titleInput = v,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: TextField(
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData,
                controller: amountController,
                //onChanged: (v) => amountInput = v,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green[600],
                child: Text('Add Transaction'),
                onPressed: submitData,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
