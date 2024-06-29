import 'package:flutter/material.dart';
import 'package:grocerry/Screens/FavouritePage.dart';
import 'package:grocerry/Screens/Menu_items/Contact_page.dart';
import 'package:grocerry/Screens/cartPage.dart';
import 'package:grocerry/Screens/login_page.dart';
import 'package:grocerry/Screens/profile.dart';
import 'package:grocerry/utils/colors.dart';

import 'header.dart';

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeContent(),
    Container(),
    Cart(),
    Container(),
    FavouritePage(),
  ];

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
      drawer: CustomDrawer(),
      body: _widgetOptions.elementAt(_selectedIndex),
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
            size: 35,
          ),
          backgroundColor: primaryColors,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
                onPressed: () => _onItemTapped(0),
                icon: Icon(
                  Icons.home,
                  color: _selectedIndex == 0 ? primaryColors : Colors.grey,
                  size: 30,
                )),
            IconButton(
                onPressed: () => _onItemTapped(1),
                icon: Icon(
                  Icons.chat,
                  color: _selectedIndex == 1 ? primaryColors : Colors.grey,
                  size: 30,
                )),
            IconButton(
                onPressed: () => _onItemTapped(3),
                icon: Icon(
                  Icons.notifications,
                  color: _selectedIndex == 3 ? primaryColors : Colors.grey,
                  size: 30,
                )),
            IconButton(
                onPressed: () => _onItemTapped(4),
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

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Header();
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScaffold(),
                  ));
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
          ListTile(
            leading: Icon(
              Icons.share,
              color: primaryColors,
            ),
            title: Text('Share App'),
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
              Icons.help,
              color: primaryColors,
            ),
            title: Text('Help'),
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
              Icons.mail,
              color: primaryColors,
            ),
            title: Text('Contact'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Contact(),
                  )); // Closes the drawer
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: primaryColors,
            ),
            title: Text('LogOut'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  )); // Closes the drawer
            },
          ),
          // Add more ListTiles here for more options
        ],
      ),
    );
  }
}
