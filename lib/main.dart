import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var totalscore = 0;
  var title = "quizoo";
  var questioncounter = 0;

  var questions = [
    {
      'question': 'Which Is The National Bird Of India',
      'answers': [
        {'text': 'Peacock', 'score': 20},
        {'text': 'Crow', 'score': 0},
        {'text': 'Eagle', 'score': 0},
        {'text': 'Ostrich', 'score': 0}
      ]
    },
    {
      'question': 'Which Is The National Capital Of India',
      'answers': [
        {'text': 'Indore', 'score': 0},
        {'text': 'Newdelhi', 'score': 20},
        {'text': 'Mumbai', 'score': 0},
        {'text': 'Banglore', 'score': 0}
      ]
    },
    {
      'question': 'Southern Tip Of India',
      'answers': [
        {'text': 'Kashmir', 'score': 0},
        {'text': 'Gujarat', 'score': 0},
        {'text': 'Meghalaya', 'score': 0},
        {'text': 'Kanyakumari', 'score': 20}
      ]
    },
    {
      'question': 'Oldest Language In India',
      'answers': [
        {'text': 'Malayalam', 'score': 20},
        {'text': 'Hindi', 'score': 0},
        {'text': 'Sanskrit', 'score': 0},
        {'text': 'Tamil', 'score': 0}
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 6.0),
            ),
          ),
        ),
        body: SafeArea(
          child: questioncounter < questions.length - 1
              ? Container(
                  color: Colors.lightBlueAccent,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Container(
                          width: 300.0,
                          height: 100.0,
                          child: Text(
                            questions[questioncounter]['question'],
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children:
                            (questions[questioncounter]['answers'] as List)
                                .map((answer) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  print(questioncounter);
                                  print(questions.length);
                                  if (questioncounter < questions.length - 1) {
                                    questioncounter = questioncounter + 1;
                                    totalscore = totalscore + answer['score'];
                                  }
                                });
                              },
                              color: Colors.white,
                              focusColor: Colors.green,
                              child: Center(
                                child: Text(
                                  answer['text'],
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                )
              : Container(
                  color: Colors.lightBlueAccent,
                  height: double.infinity,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          "your total score is $totalscore",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 20.0,
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            setState(() {
                              questioncounter = 0;
                              totalscore = 0;
                            });
                          },
                          color: Colors.white,
                          focusColor: Colors.green,
                          child: Center(
                            child: Text(
                              'reset',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
