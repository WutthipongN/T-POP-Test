import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Loading data error.'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
