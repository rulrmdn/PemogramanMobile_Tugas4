import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'ListViewLearning.dart';
import 'GridViewLearning.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState ();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    MyHomePage(),
    GridViewLearning(),
    ListsWithCards(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Demo'),
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3),
              label: 'GridView',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'ListView',
          ),
        ],
      ),
    );
  }
}
