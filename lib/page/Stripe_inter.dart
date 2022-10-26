import 'package:flutter/material.dart';
import 'package:app/main.dart';
import 'package:app/page/form_stripe.dart';
import 'package:app/page/welcome_page.dart';

import 'delayed_animation.dart';

class Stripe_inter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: 500,
                child: Container(
                  height: 170,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              /* DelayedAnimation(
                delay: 2500,
                child: Container(
                  height: 400,
                  child: Image.asset('images/yoga_2.jpeg'),
                ),
              ),*/
              DelayedAnimation(
                delay: 500,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: Text(
                    "HELLO",
                    textAlign: TextAlign.center,
                    /*style: GoogleFonts.poppins(
                      color: Colors.grey,
                      fontSize: 16,
                    ),*/
                  ),
                ),
              ),
              DelayedAnimation(
                delay: 500,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: d_red,
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(13)),
                    child: Text('Bonjour'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          // builder: (context) => SocialPage(),
                          builder: (context) => WelcomePage(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
