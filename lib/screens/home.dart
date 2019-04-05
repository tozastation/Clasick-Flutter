import 'package:flutter/material.dart';
import 'package:clasick_flutter/screens/sample.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}


class _HomeState extends State<Home> {

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clasick'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text('PlayList'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.audiotrack),
            title: new Text('My Music'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search')
          )
        ],
      ),
    );
  }
}