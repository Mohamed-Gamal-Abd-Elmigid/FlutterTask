import 'package:flutter/material.dart';
import 'package:task/Pages/graph/graph_view.dart';
import 'orders/orders_view.dart';

class MainScene extends StatefulWidget {
  const MainScene({Key? key}) : super(key: key);

  @override
  _MainSceneState createState() => _MainSceneState();
}

class _MainSceneState extends State<MainScene> {
  int index = 0;
  final screens = [
    ScreenIndex("Order Detail", const OrdersScene()),
    ScreenIndex("Order Graph", const Graph()),
  ];

  final titleAppBar = [
    "Orders Detail",
    "Orders Graph",
  ];

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: screens[index].screen,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.size.height * 0.06),
        child: AppBar(
          title: const Text("FlapKap"),
          backgroundColor: Colors.teal,
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.teal,
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          animationDuration: const Duration(seconds: 2),
          backgroundColor: Colors.grey,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: "Orders",
            ),
            NavigationDestination(
              icon: Icon(Icons.info),
              label: "Orders Graph",
            ),
          ],
        ),
      ),
    );
  }
}

class ScreenIndex {
  String? title;
  Widget? screen;

  ScreenIndex(this.title, this.screen);
}
