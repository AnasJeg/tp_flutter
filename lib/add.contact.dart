import 'package:flutter/material.dart';

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
    return AlertDialog(
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Card(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                      ),
                      child: TextFormField(
                        controller: nom,
                        decoration: const InputDecoration(
                          hintText: 'new contact',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MaterialButton(onPressed: onAdd, child: const Text("Add")),
                  MaterialButton(
                      onPressed: onCancel, child: const Text("Cancel"))
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
