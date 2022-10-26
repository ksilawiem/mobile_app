import 'package:mobile_app/page/SettingPage.dart';
import 'package:mobile_app/page/login.dart';
import 'package:mobile_app/page/profil_candidat.dart';
import 'package:mobile_app/page/test.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/page/welcome_page.dart';

import 'drawer_item.dart';

const d_red = const Color(0xFFE9717D);

void main() {
  runApp(const MyApp());
}
/* runApp(const MyApp());
}*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobSeeker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}
