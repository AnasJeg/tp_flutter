import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactBox extends StatelessWidget {
  String contactName;
  bool selContact;
  Function(bool?)? onChanged;
  Function(BuildContext context)? deleteContact;

  ContactBox({
    Key? key,
    required this.contactName,
    required this.selContact,
    required this.onChanged,
    required this.deleteContact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: deleteContact,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
            borderRadius: BorderRadius.circular(16.0),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
            side: const BorderSide(color: Colors.black, width: 1.0),
          ),
          color: Colors.blue.shade100,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: Checkbox(
              value: selContact,
              onChanged: onChanged,
              checkColor: Colors.white,
            ),
            title: Text(
              contactName,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
