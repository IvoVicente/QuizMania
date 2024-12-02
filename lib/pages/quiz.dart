import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:quizmania/pages/game_over.dart';
import 'package:quizmania/pages/home.dart';
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
                    child: CountdownTimer(
                      endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 30,
                      onEnd: () => {
                        if(context.mounted){
                          Navigator.push( context,
                          MaterialPageRoute(
                            builder: (context) => const GameOver()
                            )
                          )
                        }
                      },
                      widgetBuilder: (_, time){
                        if (time == null) {
                          return const Text(
                            '0',
                            style: TextStyle(fontSize: 24),
                          );
                        }
                        return Text('${time.sec}',
                          textAlign: TextAlign.right,
                          style: const TextStyle(fontSize: 20));
                      },
                    )
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
                        backgroundColor: isSelectedBackground
                        ) :
                        ElevatedButton.styleFrom(
                        foregroundColor: notSelectedForeground,
                        backgroundColor: notSelectedBackground
                        ),

                        child: Consumer<QuizProvider>(
                          builder: (context, notifier, child) {
                            return Text(notifier.questions[notifier.currentQuestionIndex].incorrectAnswers[0]);
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
                        backgroundColor: isSelectedBackground
                        ) :
                        ElevatedButton.styleFrom(
                        foregroundColor: notSelectedForeground,
                        backgroundColor: notSelectedBackground
                        ),

                        child: Consumer<QuizProvider>(
                          builder: (context, notifier, child) {
                            print('O index da pergunta atual é: ${notifier.currentQuestionIndex}');
                            print('O length da list é: ${notifier.questions.length}');
                            print('O length da list incorrectAnswers é: ${notifier.questions[notifier.currentQuestionIndex].incorrectAnswers.length}');

                            return Text(notifier.questions[notifier.currentQuestionIndex].incorrectAnswers[1]);
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
                        backgroundColor: isSelectedBackground
                        ) :
                        ElevatedButton.styleFrom(
                        foregroundColor: notSelectedForeground,
                        backgroundColor: notSelectedBackground
                        ),
                        
                        child: Consumer<QuizProvider>(
                          builder: (context, notifier, child) {
                            return Text(notifier.questions[notifier.currentQuestionIndex].incorrectAnswers[2]);
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
                        backgroundColor: isSelectedBackground
                        ) :
                        ElevatedButton.styleFrom(
                        foregroundColor: notSelectedForeground,
                        backgroundColor: notSelectedBackground
                        ),
                        
                        child: Consumer<QuizProvider>(
                          builder: (context, notifier, child) {
                            return Text(notifier.questions[notifier.currentQuestionIndex].correctAnswer);
                          }
                        )
                    ),
                    
                    const SizedBox(height: 40),

                    SizedBox(
                      width: 200,
                      child: Column(
                        children: [true ?
                          ElevatedButton(
                            onPressed: () {
                              var provider = Provider.of<QuizProvider>(context, listen: false);
                              
                              print('A resposta selecionada foi: $selectedAnswerIndex');

                              print(answers);
                              
                              if (answers[3] == true){
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
                                provider.restartCurrentQuestionIndex();
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
}