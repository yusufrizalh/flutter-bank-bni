import 'package:flutter/material.dart';

class GalleryPages extends StatefulWidget {
  // mendeklarasikan variabel
  final String title;

  // constructor
  const GalleryPages({super.key, required this.title});

  @override
  State<GalleryPages> createState() => _GalleryPagesState();
}

class _GalleryPagesState extends State<GalleryPages> {
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
            Text("This is Gallery Page"),
          ],
        ),
      ),
    );
  }
}
