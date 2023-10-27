import 'package:first_project/add.contact.dart';
import 'package:first_project/contact.box.dart';
import 'package:first_project/model/contact.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final txtNom = TextEditingController();
  final txtPrenom = TextEditingController();
  final txtAge = TextEditingController();
  final txtEmail = TextEditingController();

  List listContact = [
    ["aaaaa", false],
    ["bbbbb", false]
  ];
  List<Contact> listContactV2 = [
    Contact("zz", "pp", 23, "ddd", "assets/images/md.png"),
    Contact("nn", "qq", 34, "lll", "assets/images/zn.png"),
    Contact("kan", "kha", 54, "ttt", "assets/images/kan.jpeg")
  ];
  Future<void> change(bool? value, int index) async {
    setState(() {
      listContact[index][1] = value;
    });
  }

  Future<void> save() async {
    setState(() {
      // listContact.add([txt.text, false]);
      // txt.clear();
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
              nom: txtNom,
              prenom: txtPrenom,
              age: txtAge,
              email: txtEmail,
              onAdd: save,
              onCancel: () => Navigator.pop(context));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("contact"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: listContactV2.length,
        itemBuilder: (context, index) {
          return ContactBox(
            contactName: listContactV2[index].nom,
            img: listContactV2[index].photo ?? "assets/images/zn.png",
            deleteContact: (context) => delete(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showContact,
        child: const Icon(Icons.add),
      ),
    );
  }
}
