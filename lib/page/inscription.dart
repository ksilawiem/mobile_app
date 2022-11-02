import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/page/profil_candidat.dart';
import 'package:provider/provider.dart';
import '../api/api_models/provider_login.dart';
import 'delayed_animation.dart';
import 'package:mobile_app/page/test.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;

//import 'package:file_picker/file_picker.dart';
//import 'package:open_file/open_file.dart';

class Inscription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<ProviderLogin>(context);
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
                  //
                  final Map<String, dynamic> bodyData = {
                    'firstName': 'nom',
                    'lastName': 'prenom',
                    'email': 'email ',
                    'password': 'motdepasse',
                    'address': 'adresse',
                    'birthDate': 'date',
                    'city': 'ville',
                    'company': 'company',
                    'gender': ' sexe',

                    //////////////////////////////////////////
                  };
                  final respose = auth.createUser(bodyData).then((response) {
                    if (response['status'] == true) {
                      print('Successful created');
                    } else {
                      print('failed not created');
                    }
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
  TextEditingController nameController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();

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
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'FirstName',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        DelayedAnimation(
          delay: 3500,
          child: TextField(
            controller: prenomController,
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
            controller: mailController,
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
            controller: passwordController,
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
            controller: adresseController,
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
            controller: cityController,
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
            controller: dateController,
            decoration: InputDecoration(
              labelText: 'Date de naissance',
              labelStyle: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        DelayedAnimation(
          delay: 5500,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              primary: Color.fromARGB(255, 28, 13, 248),
              padding: EdgeInsets.symmetric(
                horizontal: 125,
                vertical: 13,
              ),
            ),
            child: Text(
              'importer cv',
            ),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['pdf'],
              );
              if (result == null) {
                return;
              }
              final file = result.files.first;
              print(file.name);
            },
          ),
        ),
      ]),
    );
  }
}
