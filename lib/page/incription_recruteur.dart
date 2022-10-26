import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:date_range_form_field/date_range_form_field.dart';
//import 'package:date/date.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/page/modalite_pai.dart';

import 'delayed_animation.dart';
import 'package:http/http.dart' as http;

class Inscription_recuteur extends StatelessWidget {
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
            recruForm(),
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
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => modalite_pai(),
                    ),
                  );
                  await http.post(
                      Uri.parse('http://10.0.2.2:8000/api/users/create/'),
                      body: {
                        "Role": "client",
                        // "first_name": widget.email.password
                      });
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

class recruForm extends StatefulWidget {
  @override
  _recruFormState createState() => _recruFormState();
}

class _recruFormState extends State<recruForm> {
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
