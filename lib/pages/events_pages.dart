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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // membagi kolom
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/1181244/pexels-photo-1181244.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 1",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/60626/pexels-photo-60626.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 2",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/177598/pexels-photo-177598.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 3",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 4",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/340152/pexels-photo-340152.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 5",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/693859/pexels-photo-693859.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 6",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/3987066/pexels-photo-3987066.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 7",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/1188751/pexels-photo-1188751.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 8",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/1181269/pexels-photo-1181269.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 9",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: globalColor,
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.pexels.com/photos/374559/pexels-photo-374559.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: const AlignmentDirectional(0, 0),
                      children: const [
                        Text(
                          "Event 10",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
