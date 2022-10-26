import 'package:flutter/material.dart';
import 'package:mobile_app/page/carte_bancaire.dart';
import 'package:mobile_app/page/form_stripe.dart';
import 'package:mobile_app/page/welcome_page.dart';

import 'delayed_animation.dart';

class modalite_pai extends StatelessWidget {
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
            ),
            DelayedAnimation(
              delay: 500,
              child: Container(
                height: 170,
                child: Image.asset('images/carteB.png'),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 125,
                vertical: 13,
              ),
            ),
            Row(
              children: <Widget>[
                //const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Carte Bancaire',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => SocialPage(),
                        builder: (context) => Carte_Bancaire(),
                      ),
                    );
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            DelayedAnimation(
              delay: 500,
              child: Container(
                height: 170,
                child: Image.asset('images/Stripe.png'),
              ),
            ),
            Row(
              children: <Widget>[
                //const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Stripe',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => SocialPage(),
                        builder: (context) => WelcomePage(),
                      ),
                    );
                    //signup screen
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
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
