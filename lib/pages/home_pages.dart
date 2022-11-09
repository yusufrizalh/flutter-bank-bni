import 'package:flutter/material.dart';

// naming convention: kesepakatan penulisan nama
// penulisan nama class menggunakan PascalCase
// penulisan nama variabel menggunakan camelCase
// penulisan nama file dart menggunakan snake_case

class HomePages extends StatefulWidget {
  // mendeklarasikan variabel
  final String title;

  // constructor
  const HomePages({super.key, required this.title});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
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
            Text("This is Home Page"),
          ],
        ),
      ),
    );
  }
}
