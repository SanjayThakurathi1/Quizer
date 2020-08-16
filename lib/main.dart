import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quizer(),
    );
  }
}

class Quizer extends StatefulWidget {
  @override
  _QuizerState createState() => _QuizerState();
}

class _QuizerState extends State<Quizer> {
  int x = 0;
  int correct = 0;
  int wrong = 0;
  List<Icon> scoreKeeper = [];
  List<String> question = [
    'The center of the Earth is very hot.?',
    ' The continents on which we live have been moving their locations for millions of years and will continue to move in the future.?',
    ' does the Sun go around the Earth?',
    'All radioactivity is man-made',
    'Electrons are smaller than atoms.',
    'he universe began with a huge explosion.',
    'It is the father’s gene that decides whether the baby is a boy or a girl.',
    'Antibiotics kill viruses as well as bacteria.',
  ];
  List<bool> answer = [
    true,
    true,
    false,
    false,
    true,
    true,
    true,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Text(
                        question[x],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
                child: FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      bool ans = answer[x];
                      setState(() {
                        x = x + 1;
                      });

                      if (question[x - 1] == question[question.length - 1]) {
                        Alert(buttons: [
                          DialogButton(
                              color: Colors.white,
                              child: Text(
                                "you get ${correct + wrong} score out of ${question.length} question )",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[800],
                                ),
                              ),
                              onPressed: () {
                                scoreKeeper.clear();
                                setState(() {
                                  correct = 0;
                                  x = 0;
                                });
                              }),
                          DialogButton(
                              color: Colors.white,
                              child: Text(
                                "Exit",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[800]),
                              ),
                              onPressed: () {
                                setState(() {
                                  correct = 0;
                                  x = 0;
                                  wrong = 0;
                                });
                                Navigator.pop(context);
                              }),
                        ], context: context, title: "Questions finished")
                            .show();

                        /* showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            content: Text("hlw"),
                          ),
                        );
                        */
                        setState(() {
                          x = 0;
                          scoreKeeper.clear();
                        });
                      } else {
                        if (ans == true) {
                          setState(() {
                            scoreKeeper.add(Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 35,
                            ));
                            question[x].toString();
                            correct++;
                          });
                        } else if (ans == false) {
                          setState(() {
                            {
                              scoreKeeper.add(Icon(
                                Icons.cancel,
                                color: Colors.red,
                                size: 35,
                              ));
                              question[x].toString();
                            }
                          });
                        }
                      }
                    },
                    child: Text("TRUE"))),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      bool ans = answer[x];
                      setState(() {
                        x = x + 1;
                      });

                      if (question[x - 1] == question[question.length - 1]) {
                        setState(() {
                          x = 0;
                          scoreKeeper.clear();
                        });
                        Alert(buttons: [
                          DialogButton(
                              color: Colors.white,
                              child: Text(
                                "you get ${correct + wrong} score out of ${question.length}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[800],
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  x = 0;
                                  wrong = 0;
                                });
                              }),
                          DialogButton(
                              color: Colors.white,
                              child: Text(
                                "Exit",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[800]),
                              ),
                              onPressed: () {
                                setState(() {
                                  x = 0;
                                  wrong = 0;
                                  correct = 0;
                                  scoreKeeper.clear();
                                });
                                Navigator.pop(context);
                              }),
                        ], context: context, title: "Questions finished")
                            .show();
                      } else {
                        if (ans == false) {
                          setState(() {
                            scoreKeeper.add(Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 35,
                            ));
                            question[x].toString();
                            wrong = wrong + 1;
                          });
                        } else if (ans == true) {
                          setState(() {
                            scoreKeeper.add(Icon(
                              Icons.cancel,
                              color: Colors.red,
                              size: 35,
                            ));
                            question[x].toString();
                          });
                        }
                      }
                    },
                    child: Text("False"))),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: Row(
                children: scoreKeeper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
