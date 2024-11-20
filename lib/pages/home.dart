import 'package:flutter/material.dart';
import 'package:quizmania/pages/howplay.dart';
import 'package:quizmania/pages/options.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 120, 254),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 120, 254),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 360,
              height: 360,
              child: Image.asset('assets/quiz.png'),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 250,
              child: Column(children: [
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OptionsPage()))
                  },
                  child: const Text('Play'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 70),
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 247, 203, 7),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HowPlay()))
                  },
                  child: const Text('How to play'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 247, 203, 7),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
