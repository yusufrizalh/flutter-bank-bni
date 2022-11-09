import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MasonryGridView.count(
                padding: const EdgeInsets.all(10),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return [
                    Image.network(
                      "https://images.pexels.com/photos/1181244/pexels-photo-1181244.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://images.pexels.com/photos/60626/pexels-photo-60626.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://images.pexels.com/photos/177598/pexels-photo-177598.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://images.pexels.com/photos/225250/pexels-photo-225250.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://images.pexels.com/photos/3861959/pexels-photo-3861959.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://images.pexels.com/photos/2102415/pexels-photo-2102415.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://images.pexels.com/photos/4709288/pexels-photo-4709288.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://images.pexels.com/photos/3861964/pexels-photo-3861964.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://images.pexels.com/photos/177598/pexels-photo-177598.jpeg",
                      fit: BoxFit.cover,
                    ),
                    Image.network(
                      "https://images.pexels.com/photos/3861976/pexels-photo-3861976.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ][index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
