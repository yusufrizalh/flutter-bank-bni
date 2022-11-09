import 'package:flutter/material.dart';

class AccountPages extends StatefulWidget {
  // mendeklarasikan variabel
  final String title;

  // constructor
  const AccountPages({super.key, required this.title});

  @override
  State<AccountPages> createState() => _AccountPagesState();
}

class _AccountPagesState extends State<AccountPages> {
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
            Text("This is Account Page"),
          ],
        ),
      ),
    );
  }
}
