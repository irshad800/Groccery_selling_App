import 'package:flutter/material.dart';
import 'package:grocerry/utils/colors.dart';

import 'homeScreen.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Text('logout'),
                  IconButton(
                    onPressed: () {
                      // Navigate to login screen
                    },
                    icon: Icon(Icons.logout),
                  )
                ],
              ),
              CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D'),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' Muhammed Irshad',
                    labelStyle: TextStyle(color: primaryColors),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(39),
                      borderSide: BorderSide(color: primaryColors),
                    ),
                  ),
                  controller: _nameController,
                  enabled: false,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'irshadvp800@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(39),
                      borderSide: BorderSide(color: primaryColors),
                    ),
                  ),
                  controller: _emailController,
                  enabled: false,
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '9072130225',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(39),
                      borderSide: BorderSide(color: primaryColors),
                    ),
                  ),
                  controller: _phoneController,
                  enabled: false,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Text(
                    "Edit",
                    style: TextStyle(color: primaryColors, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
