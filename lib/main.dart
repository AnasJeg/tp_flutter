import 'package:first_project/contact.list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        //  title: 'Flutter Demo',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(
        //       seedColor: Color.fromARGB(255, 165, 165, 166)),
        //   useMaterial3: true,
        // ),
        debugShowCheckedModeBanner: false,
        home: ContactList());
  }
}
