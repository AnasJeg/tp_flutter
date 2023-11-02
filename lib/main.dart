import 'package:first_project/contact.list.dart';
import 'package:first_project/contact.view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const ContactList(),
        "/view": (context) => ContactView()
      },
      initialRoute: "/",
    );
  }
}
