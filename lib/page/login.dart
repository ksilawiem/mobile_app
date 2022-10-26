import 'dart:convert';

import 'package:mobile_app/api/api_models/provider_login.dart';
import 'package:mobile_app/api/api_models/user.dart';
import 'package:mobile_app/page/profilCan.dart';
import 'package:mobile_app/page/profil_candidat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Services/globals.dart';
import '../main.dart';
import 'candi_recru.dart';
import 'carte_bancaire.dart';
import 'delayed_animation.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<Login> {
  bool _isLoading = false;

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ScaffoldState scaffoldState;
  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
     final auth = Provider.of<ProviderLogin>(context);


    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            ///////////  background///////////
            new Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 0.4, 0.9],
                  colors: [
                    Color.fromARGB(255, 106, 97, 228),
                    Color.fromARGB(255, 65, 48, 218),
                    Color.fromARGB(255, 9, 11, 138),
                  ],
                ),
              ),
            ),

            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            /////////////  Email//////////////
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: mailController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// password////////////////////
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              cursorColor: Color(0xFF9b9b9b),
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.grey,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            /////////////  LogIn Botton///////////////////
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: () async {
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileScreen()));

                                  await http.post(
                                      Uri.parse(
                                          'http://http://192.168.0.100:8000/api/users/login'),
                                      body: {
                                        "Role": "client",
                                        // "first_name": widget.email.password
                                      });
                                },
                                child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      'Connexion',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Color.fromARGB(255, 51, 34, 197),
                                  disabledColor: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0)),
                                  onPressed: () async {
                                    final respose = auth.login(mailController.text, passwordController.text).then((response) {
                                    if (response['status']) {
                                      User user = response['user'];
                                      print('Successful ${user.firstName}');
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text(response['message'])));
                                    }
                                  });
                                }
                                ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                    ////////////   forgetpassword///////////////
                    TextButton(
                      onPressed: () async {
                        //forgot password screen
                        await http.post(
                            Uri.parse(
                                'http://http://192.168.0.100:8000/api/forgetpassword/users/'),
                            body: {
                              "Role": "client",
                              // "first_name": widget.email.password
                            });
                      },
                      child: const Text(
                        'Forgot Password',
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(
                        horizontal: 125,
                        vertical: 13,
                      ),
                    ),
                    ////////////   new account///////////////
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () async {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Candi_recru()));

                          await http.post(
                              Uri.parse(
                                  'http://http://192.168.0.100:8000/api/users/create/'),
                              body: {
                                "Role": "client",
                                // "first_name": widget.email.password
                              });
                        },
                        child: Text(
                          'Create new Account',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
