import 'package:flutter/material.dart';
import 'package:mobile_app/page/profil_candidat.dart';
import 'package:mobile_app/page/test.dart';
import 'package:http/http.dart' as http;

import 'page/delayed_animation.dart';

//import 'package:file_picker/file_picker.dart';
//import 'package:open_file/open_file.dart';

class AjoutOffre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1).withOpacity(0),
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
                      "Ajouter un offre d'emploi !",
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
                  'suivant',
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
                      builder: (context) => test(),
                    ),
                  );
                  await http.post(
                      Uri.parse('http://localhost:8000/api/users/create/'),
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

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
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
              labelText: 'Nom de l offre',
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
              labelText: 'Numéro de téléphone',
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
              labelText: 'Catégorie',
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
              labelText: 'Temps',
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
              labelText: 'Logo',
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
