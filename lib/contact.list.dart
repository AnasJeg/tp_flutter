import 'package:first_project/add.contact.dart';
import 'package:first_project/contact.box.dart';
import 'package:first_project/contact.view.dart';
import 'package:first_project/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  List<Contact> listContactV2 = [
    Contact("zz", "pp", 23, "ddd", "assets/images/md.png"),
    Contact("nn", "qq", 34, "lll", "assets/images/zn.png"),
    Contact("kan", "kha", 54, "ttt", "assets/images/kan.jpeg")
  ];
  // Future<void> change(bool? value, int index) async {
  //   setState(() {
  //     listContactV2[index][1] = value;
  //   });
  // }

  Future<void> save() async {
    print(
        "${txtNom.text}, ${txtPrenom.text}, ${int.tryParse(txtAge.text) ?? 0}, ${txtEmail.text}");

    setState(() {
      listContactV2.add(Contact(txtNom.text, txtPrenom.text,
          int.tryParse(txtAge.text) ?? 0, txtEmail.text, ""));

      Navigator.of(context).pop();
    });

    Fluttertoast.showToast(
        msg: "contact ",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  Future<void> delete(index) async {
    setState(() {
      listContactV2.removeAt(index);
    });
  }

  Future<void> view(BuildContext context, int index) async {
    // Navigator.pushNamed(context, '/view', arguments: {
    //   'nom': contactV.nom,
    //   'prenom': contactV.prenom,
    //   'age': contactV.age,
    //   'email': contactV.email,
    // });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactView(
          nom: listContactV2[index].nom,
          prenom: listContactV2[index].prenom,
          age: listContactV2[index].age,
          email: listContactV2[index].email,
          image: listContactV2[index].photo,
        ),
      ),
    );
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
            img: listContactV2[index].photo,
            deleteContact: (context) => delete(index),
            onView: (context) => view(context, index),
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
