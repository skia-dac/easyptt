
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:easypage/UI/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'homepage.dart';
import 'notepage/notes_page.dart';



class MyNevBar extends StatefulWidget {
  const MyNevBar({Key? key}) : super(key: key);

  @override
  _MyNevBarState createState() => _MyNevBarState();
}
class _MyNevBarState extends State<MyNevBar>
{
  int currentIndex = 0;
  List listOfpage = [
    HomePage(),
    HomePage(),
    NotesPage(),
    SignupPage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:
      listOfpage[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index){
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: context.theme.backgroundColor,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home_rounded),
            title: Text('Home'),
            activeColor: Colors.deepPurpleAccent,
            inactiveColor: Colors.orange,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.assignment_outlined),
            title: Text('Task'),
            activeColor: Colors.deepPurpleAccent,
            inactiveColor: Colors.orange,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Note'),
            activeColor: Colors.deepPurpleAccent,
            inactiveColor: Colors.orange,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.deepPurpleAccent,
            inactiveColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
