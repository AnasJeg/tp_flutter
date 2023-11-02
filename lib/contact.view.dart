import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  final String? nom;
  final String? prenom;
  final int? age;
  final String? email;
  final String? image;

  ContactView(
      {Key? key, this.nom, this.prenom, this.age, this.email, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  image!,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Nom: $nom',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Prénom: $prenom'),
                    Text('Âge: $age'),
                    Text('Email: $email'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
