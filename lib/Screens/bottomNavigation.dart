import 'package:flutter/material.dart';
import 'package:laundry/Screens/dashBoardPage.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _navigationBarSelectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    DashBoardPage(),
    Text("History"),
    Text("Profile")
  ];

  void _onItemTap(int index) {
    setState(() {
      _navigationBarSelectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_navigationBarSelectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "Profile"),
        ],
        currentIndex: _navigationBarSelectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
