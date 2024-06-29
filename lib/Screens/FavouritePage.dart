import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/FavouriteItemList.dart';
import '../utils/colors.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({
    super.key,
    this.ontapAdd,
  });
  final String? ontapAdd;
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  void initState() {
    super.initState();
    // Set the status bar and navigation bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: primaryColors, // Status bar color
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColors,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              top: 75,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Material(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1),
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 110,
              child: Text(
                "Favourite List",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Airbnb",
                  color: Colors.white70,
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 20,
              right: 20,
              bottom: 20,
              child: (fitems == null || fitems.isEmpty)
                  ? Center(child: Image.asset("assets/images/img_6.png"))
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 9,
                        childAspectRatio: 3,
                      ),
                      itemCount: fitems.length,
                      itemBuilder: (context, index) {
                        var item = fitems[index];

                        return Stack(
                          children: [
                            Container(
                                padding: EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: Image.asset(
                                    item['image'],
                                    width: 40,
                                    height: 40,
                                  ),
                                  title: Text(
                                    item['name'],
                                    style: TextStyle(
                                      fontFamily: "Airbnb",
                                      color: primaryColors,
                                    ),
                                  ),
                                  subtitle: Text(
                                    "₹${item['price']}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Airbnb",
                                    ),
                                  ),
                                  onTap: () {},
                                )),
                            Positioned(
                              bottom: 3,
                              right: -1,
                              child: GestureDetector(
                                onTap: item['onTapadd'],
                                child: Container(
                                  height: 40,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(11),
                                    ),
                                    color: primaryColors,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      CupertinoIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
