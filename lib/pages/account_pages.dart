import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  final String title;
  const AccountPage({super.key, required this.title});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // global color
  static const globalColor = Color.fromRGBO(212, 18, 67, 0.7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Account Page"),
        backgroundColor: globalColor,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ClipPath(
                  clipper: ClippingWidget(),
                  child: Container(
                    height: 90,
                    decoration: const BoxDecoration(color: globalColor),
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image:
                            NetworkImage('https://i.ibb.co/SfkPKFh/RZ2021.png'),
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color.fromRGBO(176, 48, 96, 1),
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Hello, Welcome to Your Account!",
                  style: TextStyle(
                    fontSize: 17,
                    color: globalColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Senectus et netus et malesuada fames. Odio facilisis mauris sit amet massa vitae tortor condimentum. Scelerisque fermentum dui faucibus in ornare quam viverra. Nibh mauris cursus mattis molestie a iaculis at erat. Malesuada fames ac turpis egestas maecenas pharetra convallis. Amet mauris commodo quis imperdiet. Id nibh tortor id aliquet lectus proin nibh nisl condimentum. Diam sit amet nisl suscipit adipiscing bibendum est ultricies integer. Neque ornare aenean euismod elementum nisi. Ut lectus arcu bibendum at varius vel pharetra vel. Vitae suscipit tellus mauris a diam maecenas. Molestie nunc non blandit massa. Suspendisse interdum consectetur libero id faucibus nisl. Semper quis lectus nulla at."),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClippingWidget extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 45);
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 45,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
