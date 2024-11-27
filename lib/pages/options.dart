import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizmania/models/question.dart';
import 'package:quizmania/pages/quiz.dart';
import 'package:quizmania/pages/home.dart';
import 'package:quizmania/providers/quiz_provider.dart';
import 'package:quizmania/services/open_trivia_api_service.dart';

class OptionsPage extends StatefulWidget {

  OptionsPage({
    super.key,
  });

  Color _buttonColor = Colors.black;

  @override
  OptionStatefulState createState() => OptionStatefulState();
}

class OptionStatefulState extends State<OptionsPage>{

  List<bool> isSelected1 = [false, false];
  List<bool> isSelected2 = [false, false];

  int? _selectedCategoryValue;
  String? _selectedDifficultyValue;

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
      body: ListView(padding: const EdgeInsets.all(16.0), children: [
        const Text(
          'Category',
          style: TextStyle(fontSize: 25),
        ),
        Center(
          child: ToggleButtons(
            isSelected: isSelected1,
            onPressed: (int index) {
              (() {
                isSelected1[index] = !isSelected1[index];
              });
            },
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedCategoryValue = 10;
                  });
                },
                child: const Text('Book'),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategoryValue = 11;
                      });
                    },
                    child: const Text('Film'),
                  ))
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: ToggleButtons(
            isSelected: isSelected2,
            onPressed: (int index) {
              (() {
                isSelected2[index] = !isSelected2[index];
              });
            },
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedCategoryValue = 12;
                  });
                },
                child: const Text('Music'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                    _selectedCategoryValue = 14;
                  });
                  },
                  child: const Text('TV'),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: ToggleButtons(
            isSelected: isSelected2,
            onPressed: (int index) {
              (() {
                isSelected2[index] = !isSelected2[index];
              });
            },
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedCategoryValue = 15;
                  });
                },
                child: const Text('Games'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                    _selectedCategoryValue = 19;
                  });
                  },
                  child: const Text('Math'),
                ),
              )
            ]
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: ToggleButtons(
            isSelected: isSelected2,
            onPressed: (int index) {
              (() {
                isSelected2[index] = !isSelected2[index];
              });
            },
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedCategoryValue = 18;
                  });
                },
                child: const Text('Computers'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                    _selectedCategoryValue = 31;
                  });
                  },
                  child: const Text('Manga'),
                ),
              ),
            ]
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Difficulty',
          style: TextStyle(fontSize: 25),
        ),
        const SizedBox(height: 25),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDifficultyValue = 'easy';
                });
              },
              child: const Text('Easy'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDifficultyValue = 'medium';
                });
              },
              child: const Text('Medium'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedDifficultyValue = 'hard';
                });
              },
              child: const Text('Hard'),
            ),
          ],
        ), 
        const SizedBox(height: 80),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              if(_selectedCategoryValue != null && _selectedDifficultyValue != null){
                var questions = await OpenTriviaApiService()
                    .fetchQuestions(_selectedCategoryValue!, _selectedDifficultyValue!);
                Provider.of<QuizProvider>(context, listen: false).setQuestions(questions);
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz()));
              } else {
                
              }
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromARGB(255, 247, 203, 7),
              padding: const EdgeInsets.symmetric(horizontal: 50),
            ),
            child: const Text('Start'),
          ),
        )
      ]),
    );
  }
}
