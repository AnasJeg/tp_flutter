import 'package:first_project/add.contact.dart';
import 'package:first_project/contact.box.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final txt = TextEditingController();
  List listContact = [
    ["aaaaa", false],
    ["bbbbb", false]
  ];

  Future<void> change(bool? value, int index) async {
    setState(() {
      listContact[index][1] = value;
    });
  }

  Future<void> save() async {
    setState(() {
      listContact.add([txt.text, false]);
      txt.clear();
      Navigator.of(context).pop();
    });
  }

  Future<void> delete(index) async {
    setState(() {
      listContact.removeAt(index);
    });
  }

  void showContact() {
    showDialog(
        context: context,
        builder: (context) {
          return AddContact(
              text: txt, onAdd: save, onCancel: () => Navigator.pop(context));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("contact"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: listContact.length,
          itemBuilder: (context, index) {
            return ContactBox(
              contactName: listContact[index][0],
              selContact: listContact[index][1],
              onChanged: (value) => {change(value, index)},
              deleteContact: (context) => delete(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: showContact,
      ),
    );
  }
}
