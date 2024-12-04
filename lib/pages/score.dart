import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizmania/providers/quiz_provider.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 120, 254),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 120, 254),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Final Score',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(
                height: 60,
              ),
              Consumer<QuizProvider>(
                  builder: (context, notifier, child){
                    return Text(
                      '${notifier.score}',
                      style: const TextStyle(fontSize: 24),
                    );
                  }
                  ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  width: 200,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 247, 203, 7),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Provider.of<QuizProvider>(context, listen: false).resetScore();
                              Navigator.popUntil(context, ModalRoute.withName('/'));
                            },
                            icon: const Icon(
                              Icons.home_outlined,
                              size: 35,
                            ),
                          ),
                          const SizedBox(
                            width: 55,
                          ),
                          IconButton(
                              onPressed: () {
                                Provider.of<QuizProvider>(context, listen: false).resetScore();
                                Navigator.pushReplacementNamed(context, '/options');
                              },
                              icon: const Icon(
                                Icons.repeat,
                                size: 35,
                              )),
                        ]),
                  ),
                )),
              ]),
      ),
    );
  }
}
