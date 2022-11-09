import 'package:flutter/material.dart';
import 'package:flutter_myapp/pages/account_pages.dart';
import 'package:flutter_myapp/pages/contacts_pages.dart';
import 'package:flutter_myapp/pages/events_pages.dart';
import 'package:flutter_myapp/pages/gallery_pages.dart';
import 'package:flutter_myapp/pages/home_pages.dart';

/*
  # Widget berdasarkan nilai (state) didalamnya, dibagi menjadi 2 jenis:
    > Stateless Widget  : nilai didalam widget tidak bisa diubah
    > Stateful Widget   : nilai didalam widget bisa diubah
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Root Widget",
      home: HomePage(), // widget atau class yg pertama kali dibuka
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // global color untuk icon
  static const iconColor = Color.fromRGBO(212, 18, 67, 0.7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: myCustomDrawerMenu(), // custom drawer widget
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 240,
              pinned: true,
              backgroundColor: iconColor,
              leading: IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu),
              ),
              actions: [
                IconButton(
                  onPressed: () => debugPrint("Settings is clicked"),
                  icon: const Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () => debugPrint("Account is clicked"),
                  icon: const Icon(Icons.account_circle),
                ),
              ],
              flexibleSpace: const FlexibleSpaceBar(
                background: Image(
                  // tahap production: assets/images/image-1.jpg
                  image: AssetImage('images/image-1.jpg'),
                  //image: NetworkImage('https://images.pexels.com/photos/943096/pexels-photo-943096.jpeg'),
                  fit: BoxFit.cover,
                ),
                title: Text(
                  "Custom SliverAppBar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ];
        },
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("This is my home page"),
            ],
          ),
        ),
      ),
    );
  }

  // membuat custom drawer header
  Widget myCustomDrawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/drawer-header-bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: const [
          Positioned(
            left: 20,
            bottom: 60,
            child: CircleAvatar(
              radius: 30,
              backgroundImage:
                  NetworkImage('https://i.ibb.co/SfkPKFh/RZ2021.png'),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 30,
            child: Text(
              "Custom Drawer Header",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // membuat custom drawer menu
  Widget myCustomDrawerMenu() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        myCustomDrawerHeader(),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.home, color: iconColor),
          title: const Text("Home"),
          onTap: () {
            // menuju ke halaman HomePages
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePages(title: "Home"),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo, color: iconColor),
          title: const Text("Gallery"),
          onTap: () {
            // menuju ke halaman GalleryPages
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const GalleryPages(title: "Gallery"),
              ),
            );
          },
        ),
        ListTile(
            leading: const Icon(Icons.event, color: iconColor),
            title: const Text("Events"),
            onTap: () {
              // menuju ke halaman EventsPages
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const EventsPages(title: "Events"),
                ),
              );
            }),
        ListTile(
            leading: const Icon(Icons.contact_mail, color: iconColor),
            title: const Text("Contacts"),
            onTap: () {
              // menuju ke halaman ContactsPages
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ContactsPages(title: "Contacts"),
                ),
              );
            }),
        ListTile(
          leading: const Icon(Icons.person, color: iconColor),
          title: const Text("Account"),
          onTap: () {
            // menuju ke halaman AccountPages
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AccountPages(title: "Account"),
              ),
            );
          },
        ),
      ],
    );
  }
}
