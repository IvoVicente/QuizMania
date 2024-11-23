import 'package:flutter/material.dart';
import 'package:quizmania/pages/question.dart';
import 'package:quizmania/pages/home.dart';

class OptionsPage extends StatelessWidget {
  List<bool> isSelected1 = [false, false];
  List<bool> isSelected2 = [false, false];
  OptionsPage({
    super.key,
  });
  Color _buttonColor = Colors.black;

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
                onPressed: () {},
                child: Text('test1'),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('test2'),
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
                onPressed: () {},
                child: Text('test'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('test2'),
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
                onPressed: () {},
                child: Text('test3'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('test4'),
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
                onPressed: () {},
                child: Text('test3'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('test4'),
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
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('test1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('test2'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('test3'),
            ),
          ],
        ),
        const SizedBox(height: 80),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Jogo()));
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
