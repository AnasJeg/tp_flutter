import 'package:flutter/material.dart';

class AddContact extends StatelessWidget {
  final text;
  VoidCallback onAdd;
  VoidCallback onCancel;
  AddContact(
      {super.key,
      required this.text,
      required this.onAdd,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          children: [
            TextFormField(
              controller: text,
            ),
            Row(
              children: [
                MaterialButton(onPressed: onAdd, child: Text("add")),
                MaterialButton(onPressed: onCancel, child: Text("cancel"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
