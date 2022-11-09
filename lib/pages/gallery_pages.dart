import 'package:flutter/material.dart';

class GalleryPages extends StatefulWidget {
  // mendeklarasikan variabel
  final String title;

  // constructor
  const GalleryPages({super.key, required this.title});

  @override
  State<GalleryPages> createState() => _GalleryPagesState();
}

class _GalleryPagesState extends State<GalleryPages>
    with SingleTickerProviderStateMixin {
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
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        const TabBar(
                          labelColor: globalColor,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: globalColor,
                          indicatorWeight: 3,
                          tabs: [
                            Tab(
                              text: "Gallery 1",
                              icon: Icon(
                                Icons.photo_camera,
                              ),
                            ),
                            Tab(
                              text: "Gallery 2",
                              icon: Icon(
                                Icons.camera_indoor,
                              ),
                            ),
                            Tab(
                              text: "Gallery 3",
                              icon: Icon(
                                Icons.photo,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              SelectionArea(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Gallery 1",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SelectionArea(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Gallery 2",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SelectionArea(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "Gallery 3",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
