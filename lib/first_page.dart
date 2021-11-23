import 'package:flutter/material.dart';
import 'package:shariconsole/short_full_page.dart';
import 'package:shariconsole/shotShari.dart';
import 'full_page_shari.dart';
import 'long_shari.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _currentIndex = 0;
  var pageController = PageController;
  List<Widget> tabPages = [
    ShortShari(),
    LongShari(),
    FullPageShort(),
    FullPageLong()
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DecorationImage(image: AssetImage('image/2.jpg'), fit: BoxFit.cover);
    return Scaffold(
      body: tabPages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.image,
                color: Colors.black,
              ),
              label: "Short",
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.image, color: Colors.black),
              label: "Long",
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.image, color: Colors.black),
              label: "FullPageShort",
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(Icons.image, color: Colors.black),
              label: "FullPageLong",
              backgroundColor: Colors.transparent),
        ],
      ),
      //  backgroundColor: Colors.lightGreenAccent,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      print('on top');
      _currentIndex = index;
    });
  }
}
