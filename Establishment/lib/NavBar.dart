import 'package:flutter/material.dart';
import 'package:rezervestapp_1/CalendarPage.dart';
import 'main.dart';
import 'package:rezervestapp_1/TimeSlots.dart';
import 'package:rezervestapp_1/ProfilePage.dart';

class NavBar extends StatefulWidget {
  @override
  NavBarState createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    CalendarPage(),
    TimeSlots(),
    ProfilePage(),
  ];

  void onNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          )
        ],
        centerTitle: true,
        title: Text("Rezerv Business"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_outlined),
            label: 'Time Slots',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onNavTap,
      ),
    );
  }
}
