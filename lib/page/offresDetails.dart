import 'package:mobile_app/page/test.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:mobile_app/main.dart';

import 'answer.dart';
//import 'package:flutter_mentor_quiz_app_tut/quiz/home.dart';
//import 'package:ss/quiz/quiz_screen.dart';

class offresDetails extends StatefulWidget {
  final String image;
  final String name;
  final String description;

  const offresDetails(
      {Key? key,
      required this.image,
      required this.name,
      required this.description})
      : super(key: key);

  @override
  _offresDetailsState createState() => _offresDetailsState();
}

class _offresDetailsState extends State<offresDetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: height * 0.55,
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Color.fromARGB(255, 7, 41, 236),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              actions: [
                SizedBox(
                  width: 14,
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Stack(
              children: [
                Positioned(
                  top: 120,
                  left: 50,
                  child: Center(
                    child: Container(
                      child: Hero(
                          tag: 'shadow${widget.image}',
                          child: Image.asset(
                            widget.image,
                            color: Colors.black.withOpacity(0.4),
                          )),
                      width: width * 0.8,
                      height: height * 0.3,
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 40,
                  child: Center(
                    child: Container(
                      child: Hero(
                          tag: 'image${widget.image}',
                          child: Image.asset(widget.image)),
                      width: width * 0.8,
                      height: height * 0.3,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: width * 0.32,
                  child: Center(
                    child: Text(
                      widget.name,
                      style: TextStyle(fontSize: 33, fontFamily: 'Nunito'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.5,
                      ),
                      ReadMoreText(
                        widget.description,
                        trimLines: 3,
                        colorClickableText: Colors.blue,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: height * 0.11,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Postuler',
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.blueAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
