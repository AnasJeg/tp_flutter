import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ContactBox extends StatelessWidget {
  String contactName;
  String? img;

  Function(BuildContext context)? deleteContact;
  Function(BuildContext context) onView;

  ContactBox(
      {Key? key,
      required this.contactName,
      this.img,
      required this.deleteContact,
      required this.onView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: onView,
                backgroundColor: Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.share,
                label: 'Show',
                borderRadius: BorderRadius.circular(16.0),
              ),
            ],
          ),
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
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: const BorderSide(color: Colors.black, width: 1.0),
            ),
            color: Colors.blue.shade100,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: img!.isEmpty
                  ? Image.asset("assets/images/zn.png")
                  : Image.asset(img!),
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
        ));
  }
}
