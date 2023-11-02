import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddContact extends StatelessWidget {
  final TextEditingController nom;
  final TextEditingController prenom;
  final TextEditingController age;
  final TextEditingController email;
  final VoidCallback onAdd;
  final VoidCallback onCancel;

  AddContact({
    Key? key,
    required this.nom,
    required this.prenom,
    required this.age,
    required this.email,
    required this.onAdd,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return AlertDialog(
      content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 2.0)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'nom',
                      labelText: 'Nom',
                    ),
                    controller: nom,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 2.0)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'prenom',
                      labelText: 'Prenom',
                    ),
                    controller: prenom,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 2.0)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'age',
                      labelText: 'Age',
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    controller: age,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueGrey, width: 2.0)),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'email',
                      labelText: 'Email',
                    ),
                    controller: email,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please fill this field';
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          onAdd();
                        } else {
                          Fluttertoast.showToast(
                              msg: "not valid ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        }
                      },
                      child: const Text('Ajouter'))
                ],
              ),
            ),
          )),
    );
  }
}
