import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactBox extends StatelessWidget {
  String contactName;
  bool selContact;
  Function(bool?)? onChanged;
  Function(BuildContext context)? deleteContact;
  ContactBox(
      {super.key,
      required this.contactName,
      required this.selContact,
      required this.onChanged,
      required this.deleteContact});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteContact,
              backgroundColor: Color.fromARGB(255, 255, 17, 17),
              foregroundColor: Colors.black,
              icon: Icons.delete,
              label: 'Delete',
            ),
            // SlidableAction(
            //   onPressed: doNothing,
            //   backgroundColor: Color(0xFF0392CF),
            //   foregroundColor: Colors.white,
            //   icon: Icons.save,
            //   label: 'Save',
            // ),
          ],
        ),
        child: Card(
          color: Colors.blue.shade200,
          child: Row(
            children: [
              Checkbox(
                value: selContact,
                onChanged: onChanged,
                checkColor: Colors.white,
              ),
              Text(
                contactName,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        ));
  }
}
