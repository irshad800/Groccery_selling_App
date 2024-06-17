import 'package:flutter/material.dart';
import 'package:grocerry/Screens/demo.dart';
import 'package:grocerry/Screens/profile.dart';
import 'package:grocerry/utils/colors.dart';

import 'header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: primaryColors,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: primaryColors,
              ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart, color: primaryColors),
              label: 'Cart'),
          BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => demo()));
                  },
                  icon: Icon(Icons.notifications, color: primaryColors)),
              label: 'Notification'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: primaryColors),
            label: 'Favourite',
          ),
        ],

        currentIndex: 0, // Set the current index to highlight the favorite item
        selectedItemColor: Colors.black, // Color for selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        selectedLabelStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Airbnb",
            fontSize: 11), // Color for selected label
        unselectedLabelStyle:
            TextStyle(color: Colors.grey, fontFamily: "Airbnb"),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        toolbarHeight: 0, // Removes the default AppBar space
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 110,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: primaryColors,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: primaryColors,
              ),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: primaryColors,
              ),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(),
                    )); // Closes the drawer
              },
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: primaryColors,
              ),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserProfileScreen(),
                    )); // Closes the drawer
              },
            ),
            // Add more ListTiles here for more options
          ],
        ),
      ),
      body: const Header(),
    );
  }
}
