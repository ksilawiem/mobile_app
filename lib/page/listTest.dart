import 'package:mobile_app/page/test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app/Services/auth.dart';
import 'package:mobile_app/page/login.dart';

import 'SettingPage.dart';
import 'offres.dart';
import 'profil_candidat.dart';

class ListTest extends StatelessWidget {
  List img = [
    'images/java.png',
    'images/php.png',
    'images/c.png',
  ];

  List names = [
    ' Java',
    ' PHP',
    'C++',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //var names;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Tests '),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
              height: height * 0.3,
              width: width,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 162, 21, 197),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'My tests',
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'Nunito',
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(100),
                      elevation: 8,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                          hintText: 'Search',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: Material(
                              borderRadius: BorderRadius.circular(100),
                              elevation: 8,
                              child: Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.32,
                ),
                Container(
                  height: height * 0.4,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: names.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FoodItemCard(
                        name: names[index],
                        //description: details[index],
                        imgPath: img[index], description: '',
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('JobSeeker'),
            ),
            ListTile(
              title: const Text('offres'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => test()));
              },
            ),
            ListTile(
              title: const Text('profil'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Profil_candidat()));
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => SettingsPage()));
              },
            ),
            ListTile(
              title: const Text('My candidats'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            ListTile(
              title: const Text('logout'),
              onTap: () {
                // Update the state of the app.
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => Login()));
              },
            ),
          ],
        ),
      ), // Populate the Drawer in the next step.
    );
  }
}
