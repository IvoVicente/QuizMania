import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizmania/pages/game_over.dart';
import 'package:quizmania/pages/score.dart';
import 'package:quizmania/providers/quiz_provider.dart';
import 'package:provider/provider.dart';

class Quiz extends StatefulWidget {

  const Quiz({super.key});
  
  @override
  State<StatefulWidget> createState() => _QuizState();
}

class _QuizState extends State<Quiz>{
  List<bool> answers = [false, false, false, false];
  int? selectedAnswerIndex;

  final Color notSelectedForeground  = Colors.black;
  final Color notSelectedBackground  = const Color.fromARGB(255, 231, 230, 236);

  final Color isSelectedForeground  = Colors.black;
  final Color isSelectedBackground  = const Color.fromARGB(255, 247, 203, 7);

  bool isMultiple(String questionType){
    if(questionType == 'multiple'){
      return true;
    }
    return false;
  }

  int seconds = 30;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        seconds--;
      });
      if(seconds == 0){
        if(context.mounted){
          Navigator.push( context,
          MaterialPageRoute(
            builder: (context) => const GameOver()
            )
          );
        }
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 1, 160, 252),
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 1, 160, 252),
            leading: IconButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              icon: const Icon(Icons.home_outlined),
              iconSize: 40.0,
            ),
            ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
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
                        notifier.questions[notifier.currentQuestionIndex].question,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20),
                      );
                    }),
                  ),
              ),

              const SizedBox(height: 20),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: time()
                  ) 
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                    children: [

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (answers.contains(true)){
                            answers[1] = false;
                            answers[2] = false;
                            answers[3] = false;
                          }
                          answers[0] = true;
                          selectedAnswerIndex = 0;
                        });
                      },
                        style: answers[0] ?
                        ElevatedButton.styleFrom(
                        foregroundColor: isSelectedForeground,
                        backgroundColor: isSelectedBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                        ) :
                        ElevatedButton.styleFrom(
                        foregroundColor: notSelectedForeground,
                        backgroundColor: notSelectedBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                        ),

                        child: Consumer<QuizProvider>(
                          builder: (context, notifier, child) {
                            return Text(notifier.questions[notifier.currentQuestionIndex].allAnswers[0]);
                          }
                        )
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (answers.contains(true)){
                            answers[0] = false;
                            answers[2] = false;
                            answers[3] = false;
                          }
                          answers[1] = true;
                          selectedAnswerIndex = 1;
                        });
                      },
                        style: answers[1] ?
                        ElevatedButton.styleFrom(
                        foregroundColor: isSelectedForeground,
                        backgroundColor: isSelectedBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                        ) :
                        ElevatedButton.styleFrom(
                        foregroundColor: notSelectedForeground,
                        backgroundColor: notSelectedBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                        ),

                        child: Consumer<QuizProvider>(
                          builder: (context, notifier, child) {
                            return Text(notifier.questions[notifier.currentQuestionIndex].allAnswers[1]);
                          }
                        )
                    ),

                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (answers.contains(true)){
                            answers[1] = false;
                            answers[0] = false;
                            answers[3] = false;
                          }
                          answers[2] = true;
                          selectedAnswerIndex = 2;
                        });
                      },
                        style: answers[2] ?
                        ElevatedButton.styleFrom(
                        foregroundColor: isSelectedForeground,
                        backgroundColor: isSelectedBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                        ) :
                        ElevatedButton.styleFrom(
                        foregroundColor: notSelectedForeground,
                        backgroundColor: notSelectedBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                        ),
                        
                        child: Consumer<QuizProvider>(
                          builder: (context, notifier, child) {
                            return Text(notifier.questions[notifier.currentQuestionIndex].allAnswers[2]);
                          }
                        )
                    ),
                   
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (answers.contains(true)){
                            answers[1] = false;
                            answers[2] = false;
                            answers[0] = false;
                          }
                          answers[3] = true;
                          selectedAnswerIndex = 3;
                          print(selectedAnswerIndex);
                        });
                      },
                        style: answers[3] ?
                        ElevatedButton.styleFrom(
                        foregroundColor: isSelectedForeground,
                        backgroundColor: isSelectedBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                        ) :
                        ElevatedButton.styleFrom(
                        foregroundColor: notSelectedForeground,
                        backgroundColor: notSelectedBackground,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                        ),
                        
                        child: Consumer<QuizProvider>(
                          builder: (context, notifier, child) {
                            return Text(notifier.questions[notifier.currentQuestionIndex].allAnswers[3]);
                          }
                        )
                    ),

                    const SizedBox(height: 20),

                  /* Ink(
                    decoration: BoxDecoration(
                      color: answers[0] ? isSelectedBackground : notSelectedBackground,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          if (answers.contains(true)){
                            answers[1] = false;
                            answers[2] = false;
                            answers[3] = false;
                          }
                          answers[0] = true;
                          selectedAnswerIndex = 0;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        child: Center(
                          child: Consumer<QuizProvider>(
                            builder: (context, notifier, child) {
                            return Text(notifier.questions[notifier.currentQuestionIndex].allAnswers[2]);
                          }
                        )
                        )
                        ),
                    )
                  ), */

                    const SizedBox(height: 40),

                    SizedBox(
                      width: 200,
                      child: Column(
                        children: [answers.contains(true) ?
                          ElevatedButton(
                            onPressed: () {
                              var provider = Provider.of<QuizProvider>(context, listen: false);

                              String correctAnswer = provider.questions[provider.currentQuestionIndex].correctAnswer;
                              String selectedAnswer = provider.questions[provider.currentQuestionIndex].allAnswers[selectedAnswerIndex!];
                              
                              print('Resposta selecionada: $selectedAnswer');
                              print('Resposta correta: $correctAnswer');

                              if (selectedAnswer == correctAnswer){
                                print('Pontuou');
                                provider.updateScore();
                              }
                              
                              if(provider.currentQuestionIndex < 9){
                                provider.updateCurrentQuestionIndex();
                                Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                  builder: (context) => const Quiz()
                                  )
                                );
                              } else if (provider.currentQuestionIndex == 9) {
                                provider.resetCurrentQuestionIndex();
                                Navigator.pushReplacement(
                                context, MaterialPageRoute(
                                  builder: (context) => const Score()
                                  )
                                );
                              }
                            },                            
                            style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor:const Color.fromARGB(255, 247, 203, 7),
                            padding: const EdgeInsets.symmetric(horizontal: 70)),
                            child: const Text('Confirm'),
                          ) : const Text('')
                        ],
                      ),
                    )
                  ],
                )
              ),
            ]
          )
      )
    );
  }

  Widget time(){
    return Text('$seconds',
    textAlign: TextAlign.right,
    style: const TextStyle(fontSize: 20));
  }

  Widget answerButton(int answerIndex, int buttonGroupLength){
    return Ink(
            decoration: BoxDecoration(
              color: answers[0] ? isSelectedBackground : notSelectedBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                setState(() {
                  answers[answerIndex] = true;
                  for(int i = 0; i < buttonGroupLength; i++){
                    if(i != answerIndex){
                    answers[i] = false;
                  }
                  }
                  selectedAnswerIndex = answerIndex;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Consumer<QuizProvider>(
                    builder: (context, notifier, child) {
                    return Text(notifier.questions[notifier.currentQuestionIndex].allAnswers[2]);
                  }
                )
                )
                ),
            )
          );
  }
}