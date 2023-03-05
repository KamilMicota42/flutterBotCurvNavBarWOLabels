import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int navBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    final navBarItems = <Widget>[
      Icon((navBarIndex == 0) ? Icons.home_outlined : Icons.home),
      Icon((navBarIndex == 1) ? Icons.map_outlined : Icons.map),
      Icon((navBarIndex == 2) ? Icons.notifications_outlined : Icons.notifications),
    ];

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Center(
          child: Text('Hello World!'),
        ),
        extendBody: true, // if the background of navbar isnt transparent, happens when theres picture in the background
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: const IconThemeData(color: Colors.white),
            
          ),
          child: CurvedNavigationBar(
            height: 60,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 200),
            index: navBarIndex,
            items: navBarItems,
            color: const Color.fromRGBO(17, 44, 72, 1),
            buttonBackgroundColor: const Color.fromRGBO(17, 44, 72, 1),
            
            backgroundColor: Colors.transparent,
            onTap: (navBarIndex) => setState(() => this.navBarIndex = navBarIndex),
          ),
        ),
      ),
    );
  }
}
