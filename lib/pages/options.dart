import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizmania/models/question.dart';
import 'package:quizmania/pages/quiz.dart';
import 'package:quizmania/pages/home.dart';
import 'package:quizmania/providers/quiz_provider.dart';
import 'package:quizmania/services/open_trivia_api_service.dart';

class OptionsPage extends StatefulWidget {

 const OptionsPage({
    super.key,
  });

  @override
  OptionStatefulState createState() => OptionStatefulState();
}

class OptionStatefulState extends State<OptionsPage>{
  List<Question> questions = [];

  List<bool> isSelected1 = [false, false];
  List<bool> isSelected2 = [false, false];

  List<bool> isSelectedDifficulty = [false, false, false];
  List<bool> isSelectedCategory = [false, false, false, false, false, false, false, false];

  int? _selectedCategoryValue;
  String? _selectedDifficultyValue;

  final Color notSelectedForeground = Colors.black;
  final Color notSelectedBackground = const Color.fromARGB(255, 231, 230, 236);

  final Color isSelectedForeground = Colors.black;
  final Color isSelectedBackground = const Color.fromARGB(255, 247, 203, 7);

  @override
  Widget build(BuildContext context){
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
          style: TextStyle(fontSize: 20),
        ),

        const SizedBox(height: 25),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded( child: ElevatedButton(
              onPressed: () {
              setState(() {
                if (isSelectedCategory.contains(true)){
                  isSelectedCategory[1] = false;
                  isSelectedCategory[2] = false;
                  isSelectedCategory[3] = false;
                  isSelectedCategory[4] = false;
                  isSelectedCategory[5] = false;
                  isSelectedCategory[6] = false;
                  isSelectedCategory[7] = false;
                }
                isSelectedCategory[0] = true;
                _selectedCategoryValue = 10;
              });
            },
            style: isSelectedCategory[0] ?
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
              child: const Text('Book'),
            )
            ),

            const SizedBox(width: 15),

            Expanded(
              child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (isSelectedCategory.contains(true)){
                          isSelectedCategory[0] = false;
                          isSelectedCategory[2] = false;
                          isSelectedCategory[3] = false;
                          isSelectedCategory[4] = false;
                          isSelectedCategory[5] = false;
                          isSelectedCategory[6] = false;
                          isSelectedCategory[7] = false;
                        }
                        isSelectedCategory[1] = true;
                        _selectedCategoryValue = 11;
                      });
                    },
                    style: isSelectedCategory[1] ?
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
                    child: const Text('Film'))
              )
          ],
        ),

        const SizedBox(height: 10),
        
        Center(
          child: Row(
            children: <Widget>[
              Expanded( child:
              ElevatedButton(
                  onPressed: () {
                setState(() {
                  if (isSelectedCategory.contains(true)){
                    isSelectedCategory[0] = false;
                    isSelectedCategory[1] = false;
                    isSelectedCategory[3] = false;
                    isSelectedCategory[4] = false;
                    isSelectedCategory[5] = false;
                    isSelectedCategory[6] = false;
                    isSelectedCategory[7] = false;
                  }
                  isSelectedCategory[2] = true;
                  _selectedCategoryValue = 12;
                });
              },
              style: isSelectedCategory[2] ?
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
                child: const Text('Music'),
              ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                setState(() {
                  if (isSelectedCategory.contains(true)){
                    isSelectedCategory[0] = false;
                    isSelectedCategory[1] = false;
                    isSelectedCategory[2] = false;
                    isSelectedCategory[4] = false;
                    isSelectedCategory[5] = false;
                    isSelectedCategory[6] = false;
                    isSelectedCategory[7] = false;
                  }
                  isSelectedCategory[3] = true;
                  _selectedCategoryValue = 14;
                });
              },
              style: isSelectedCategory[3] ?
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
                  child: const Text('TV'),
                ),
              )
            ],
          ),
        ),
        
        const SizedBox(height: 10),

        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded( child:
              ElevatedButton(
                  onPressed: () {
                setState(() {
                  if (isSelectedCategory.contains(true)){
                    isSelectedCategory[0] = false;
                    isSelectedCategory[1] = false;
                    isSelectedCategory[2] = false;
                    isSelectedCategory[3] = false;
                    isSelectedCategory[5] = false;
                    isSelectedCategory[6] = false;
                    isSelectedCategory[7] = false;
                  }
                  isSelectedCategory[4] = true;
                  _selectedCategoryValue = 15;
                });
              },
              style: isSelectedCategory[4] ?
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
                child: const Text('Games'),
              ),
              ),

              const SizedBox(width: 15,),

              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                setState(() {
                  if (isSelectedCategory.contains(true)){
                    isSelectedCategory[0] = false;
                    isSelectedCategory[1] = false;
                    isSelectedCategory[2] = false;
                    isSelectedCategory[3] = false;
                    isSelectedCategory[4] = false;
                    isSelectedCategory[6] = false;
                    isSelectedCategory[7] = false;
                  }
                  isSelectedCategory[5] = true;
                  _selectedCategoryValue = 19;
                });
              },
              style: isSelectedCategory[5] ?
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
                  child: const Text('Math'),
                ),
              )
            ]
          ),
        ),
        const SizedBox(height: 10),

        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded( child: ElevatedButton(
                  onPressed: () {
                setState(() {
                  if (isSelectedCategory.contains(true)){
                    isSelectedCategory[1] = false;
                    isSelectedCategory[2] = false;
                    isSelectedCategory[3] = false;
                    isSelectedCategory[4] = false;
                    isSelectedCategory[5] = false;
                    isSelectedCategory[0] = false;
                    isSelectedCategory[7] = false;
                  }
                  isSelectedCategory[6] = true;
                  _selectedCategoryValue = 18;
                });
              },
              style: isSelectedCategory[6] ?
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
                child: const Text('Computers'),
              ),
              ),

              const SizedBox(width: 15),
              
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                setState(() {
                  if (isSelectedCategory.contains(true)){
                    isSelectedCategory[1] = false;
                    isSelectedCategory[2] = false;
                    isSelectedCategory[3] = false;
                    isSelectedCategory[4] = false;
                    isSelectedCategory[5] = false;
                    isSelectedCategory[6] = false;
                    isSelectedCategory[0] = false;
                  }
                  isSelectedCategory[7] = true;
                  _selectedCategoryValue = 31;
                });
              },
              style: isSelectedCategory[7] ?
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
                  child: const Text('Manga'),
                ),
              ),
            ]
          ),
        ),


        const SizedBox(height: 50),

        const Text(
          'Difficulty',
          style: TextStyle(fontSize: 20),
        ),

        const SizedBox(height: 25),
        
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isSelectedDifficulty.contains(true)){
                    isSelectedDifficulty[1] = false;
                    isSelectedDifficulty[2] = false;
                  }
                  isSelectedDifficulty[0] = true;
                  _selectedDifficultyValue = 'easy';
                });
              },
              style: isSelectedDifficulty[0] ?
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
              child: const Text('Easy'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isSelectedDifficulty.contains(true)){
                    isSelectedDifficulty[0] = false;
                    isSelectedDifficulty[2] = false;
                  }
                  isSelectedDifficulty[1] = true;
                  _selectedDifficultyValue = 'medium';
                });
              },
              style: isSelectedDifficulty[1] ?
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
              child: const Text('Medium'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isSelectedDifficulty.contains(true)){
                    isSelectedDifficulty[0] = false;
                    isSelectedDifficulty[1] = false;
                  }
                  isSelectedDifficulty[2] = true;
                  _selectedDifficultyValue = 'hard';
                });
              },
              style: isSelectedDifficulty[2] ?
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
              child: const Text('Hard'),
            ),
          ],
        ), 
        const SizedBox(height: 80),
        Center(
          child: ElevatedButton(
            onPressed: () async {
                if(_selectedCategoryValue != null && _selectedDifficultyValue != null){
                var apiService = OpenTriviaApiService();
                questions = await apiService.fetchQuestions(
                  _selectedCategoryValue!,
                  _selectedDifficultyValue!
                );
                }
              if(context.mounted){
                Provider.of<QuizProvider>(context, listen: false).updateQuestions(questions);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Quiz()));
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
