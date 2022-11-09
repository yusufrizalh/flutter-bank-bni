import 'package:flutter/material.dart';

class ContactsPages extends StatefulWidget {
  // mendeklarasikan variabel
  final String title;

  // constructor
  const ContactsPages({super.key, required this.title});

  @override
  State<ContactsPages> createState() => _ContactsPagesState();
}

class _ContactsPagesState extends State<ContactsPages> {
  // global color
  static const globalColor = Color.fromRGBO(212, 18, 67, 0.7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: globalColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("This is Contacts Page"),
          ],
        ),
      ),
    );
  }
}
