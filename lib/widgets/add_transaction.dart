import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function addNewTransaction;

  AddTransaction(this.addNewTransaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final amountController = TextEditingController();
  final titleController = TextEditingController();

  void addTransaction() {
    if (titleController.text.isNotEmpty && amountController.text.isNotEmpty) {
      widget.addNewTransaction(
        titleController.text,
        double.parse(amountController.text),
      );
      titleController.clear();
      amountController.clear();
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => addTransaction(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => addTransaction(),
            ),
            TextButton(
              onPressed: addTransaction,
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
