import 'package:flutter/material.dart';
import 'package:quizmania/models/question.dart';
import 'package:quizmania/pages/home.dart';
import 'package:quizmania/providers/quiz_provider.dart';
import 'package:provider/provider.dart';

class Quiz extends StatefulWidget {

  Quiz({super.key});
  
  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 1, 160, 252),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 1, 160, 252),
            leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.home_outlined),
              iconSize: 40.0,
            ),
            actions: [
              IconButton(
                  icon: const Icon(Icons.forward, size: 40.0), onPressed: () {})
            ]),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                margin: const EdgeInsets.only(top: 0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Consumer<QuizProvider>(
                  builder: (context, notifier, child) {
                    return Text(
                      //'Question',
                      notifier.questions[notifier.currentQuestionIndex].question,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 20),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text('00:30',
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 20)))
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Consumer<QuizProvider>(
                            builder: (context, notifier, child){
                              return Text(
                                notifier.questions[notifier.currentQuestionIndex].incorrectAnswers[0],
                                style: const TextStyle(color: Colors.black)
                              );
                            }
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Consumer<QuizProvider>(
                            builder: (context, notifier, child){
                              return Text(
                                notifier.questions[notifier.currentQuestionIndex].incorrectAnswers[1],
                                style: const TextStyle(color: Colors.black)
                              );
                            }
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Consumer<QuizProvider>(
                            builder: (context, notifier, child){
                              return Text(
                                notifier.questions[notifier.currentQuestionIndex].incorrectAnswers[2],
                                style: const TextStyle(color: Colors.black)
                              );
                            }
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Consumer<QuizProvider>(
                            builder: (context, notifier, child){
                              return Text(
                                notifier.questions[notifier.currentQuestionIndex].correctAnswer,
                                style: const TextStyle(color: Colors.black)
                              );
                            }
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 200,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {},                            
                                style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor:const Color.fromARGB(255, 247, 203, 7),
                                padding: const EdgeInsets.symmetric(horizontal: 70)),
                                child: const Text('Confirm'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ])));
  }
}
