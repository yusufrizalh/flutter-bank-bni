import 'package:flutter/material.dart';

class EventsPages extends StatefulWidget {
  // mendeklarasikan variabel
  final String title;

  // constructor
  const EventsPages({super.key, required this.title});

  @override
  State<EventsPages> createState() => _EventsPagesState();
}

class _EventsPagesState extends State<EventsPages> {
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
            Text("This is Events Page"),
          ],
        ),
      ),
    );
  }
}
