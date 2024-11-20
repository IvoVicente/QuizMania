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
      backgroundColor: Color.fromARGB(255, 1, 160, 252),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 1, 160, 252),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: Icon(Icons.home_outlined),
          iconSize: 40.0,
        ),
      ),
      body: ListView(padding: EdgeInsets.all(16.0), children: [
        Text(
          'Category',
          style: TextStyle(fontSize: 25),
        ),
        Center(
          child: ToggleButtons(
            children: <Widget>[
              ElevatedButton(
                onPressed: () {},
                child: Text('test1'),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('test2'),
                  ))
            ],
            isSelected: isSelected1,
            onPressed: (int index) {
              (() {
                isSelected1[index] = !isSelected1[index];
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: ToggleButtons(
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
            isSelected: isSelected2,
            onPressed: (int index) {
              (() {
                isSelected2[index] = !isSelected2[index];
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: ToggleButtons(
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
            ],
            isSelected: isSelected2,
            onPressed: (int index) {
              (() {
                isSelected2[index] = !isSelected2[index];
              });
            },
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: ToggleButtons(
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
              ),
            ],
            isSelected: isSelected2,
            onPressed: (int index) {
              (() {
                isSelected2[index] = !isSelected2[index];
              });
            },
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          'Difficulty',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(height: 25),
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
        SizedBox(height: 80),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Jogo()));
            },
            child: Text('Start'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Color.fromARGB(255, 247, 203, 7),
              padding: EdgeInsets.symmetric(horizontal: 50),
            ),
          ),
        )
      ]),
    );
  }
}
