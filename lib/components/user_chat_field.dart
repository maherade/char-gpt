import 'package:flutter/material.dart';

class UserField extends StatelessWidget {
  String text;

  UserField({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(color: Colors.grey.shade200),
            textAlign: TextAlign.end,
          ),
          trailing: Icon(
            Icons.account_circle_sharp,
            color: Colors.grey.shade300,
            size: 30,
          ),
        ));
  }
}
