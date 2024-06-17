import 'package:flutter/material.dart';
import 'package:grocerry/Screens/groc_items/food.dart';
import 'package:grocerry/Screens/groc_items/fruit.dart';
import 'package:grocerry/Screens/groc_items/groccery.dart';
import 'package:grocerry/Screens/groc_items/vegetables.dart';
import 'package:grocerry/Screens/profile.dart';
import 'package:grocerry/utils/colors.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderPartState();
}

class _HeaderPartState extends State<Header> {
  final PageController _pageController = PageController();
  int selectedIndex = 0;

  List<String> ite = [" Food  ", " Fruit  ", " Vegetable ", " Grocery "];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ite.length,
      child: Column(
        children: [
          const SizedBox(height: 0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[350],
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      child: const Icon(Icons.menu_open_rounded),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: primaryColors,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Calicut,KL",
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserProfileScreen()));
                  },
                  child: CircleAvatar(
                    radius: 21, // Adjust the radius as needed
                    backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Hi Irshad",
                style: TextStyle(
                    fontSize: 30, color: primaryColors, fontFamily: "Airbnb"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                "Find your food",
                style: TextStyle(
                    fontFamily: "Airbnb",
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: primaryColors)),
                hintText: "Search Food",
                suffixIcon: IconButton(
                    color: primaryColors,
                    onPressed: () {},
                    icon: const Icon(Icons.filter_list_alt)),
                prefixIcon: Icon(
                  Icons.search,
                  color: primaryColors,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TabBar(
              isScrollable: true,
              indicatorColor: primaryColors,
              labelColor: primaryColors,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: "Airbnb"),
              tabs: ite.map((name) => Tab(text: name)).toList(),
              indicatorPadding: const EdgeInsets.only(left: 0),
              tabAlignment: TabAlignment.start,
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      food(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      fruit(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      vegetable(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      grocerry(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
