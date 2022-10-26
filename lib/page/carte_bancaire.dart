import 'package:flutter/material.dart';
import 'package:mobile_app/page/profil_recru.dart';
import 'delayed_animation.dart';
//import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:intl/intl.dart';

class Carte_Bancaire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DelayedAnimation(
                    delay: 1500,
                    child: Text(
                      "create you account !",
                      /* style: GoogleFonts.poppins(
                        color: d_red,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),*/
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35),
            LoginForm(),
            SizedBox(height: 125),
            DelayedAnimation(
              delay: 5500,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Color.fromARGB(255, 243, 13, 193),
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                  'valider',
                  /* style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),*/
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profil_recrut(),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 35),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: DelayedAnimation(
                    delay: 6500,
                    child: Text(
                      "SKIP",
                      /*style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),*/
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(children: [
        DelayedAnimation(
          delay: 3500,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        DelayedAnimation(
          delay: 3500,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'LastName',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        DelayedAnimation(
          delay: 3500,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        DelayedAnimation(
          delay: 4500,
          child: TextField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
              labelText: 'mot de passe',
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
          ),
        ),
        DelayedAnimation(
          delay: 3500,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Adresse',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        DelayedAnimation(
          delay: 3500,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Ville',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        DelayedAnimation(
          delay: 3500,
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Entreprise',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
