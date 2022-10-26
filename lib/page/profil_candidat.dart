import 'package:mobile_app/page/Mes%20candidature.dart';
import 'package:mobile_app/page/test.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/page/edit_profil.dart';
import 'package:mobile_app/page/login.dart';

import 'SettingPage.dart';
import 'listTest.dart';
//import 'package:google_fonts/google_fonts.dart';

class Profil_candidat extends StatelessWidget {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 7, 41, 236),
              ],
              begin: FractionalOffset.bottomCenter,
              end: FractionalOffset.topCenter,
            ),
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: const Text('Profil'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'My\nProfile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nisebuschgardens',
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    height: height * 0.43,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;

                        var antDesign;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.72,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 80,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              right: 20,
                              child: Icon(
                                antDesign.setting,
                                color: Colors.grey[700],
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: 70,
                              left: 140,
                              right: 140,
                              child: Center(
                                child: Container(
                                  height: height * 0.1,
                                  width: width * 0.2,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('images/yoga_1.png'),
                                      fit: BoxFit.cover,
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.5,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Mon profil',
                            style: TextStyle(
                              color: Color.fromRGBO(39, 105, 171, 1),
                              fontSize: 27,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          Divider(
                            thickness: 2.5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: height * 0.15,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
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
                        new MaterialPageRoute(builder: (context) => candi()));
                  },
                ),
                ListTile(
                  title: const Text('My tests'),
                  onTap: () {
                    // Update the state of the app.
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => ListTest()));
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
          ),
        )
      ],
    );
  }
}
