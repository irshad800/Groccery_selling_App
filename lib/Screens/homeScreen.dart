import 'package:flutter/material.dart';
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
      body: Header(),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          shape: CircleBorder(),
          elevation: 5,
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          backgroundColor: primaryColors,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? primaryColors : Colors.grey,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                icon: Icon(
                  Icons.chat,
                  color: _selectedIndex == 1 ? primaryColors : Colors.grey,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 3;
                  });
                },
                icon: Icon(
                  Icons.notifications,
                  color: _selectedIndex == 3 ? primaryColors : Colors.grey,
                  size: 30,
                )),
            IconButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: _selectedIndex == 4 ? primaryColors : Colors.grey,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
