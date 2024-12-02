import 'package:flutter/material.dart';
import 'package:quizmania/pages/score.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 120, 254),
      appBar: AppBar(
        backgroundColor:const  Color.fromARGB(255, 2, 120, 254),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 360,
              height: 360,
              child: Image.asset('assets/gameOver.png'),
            ),
            Column(
              children: [ElevatedButton.icon(
                label: const Text(''),
                icon: const Icon(Icons.arrow_forward, size: 30),
                onPressed: () => {
                  Navigator.push( context,
                    MaterialPageRoute(
                      builder: (context) => const Score()
                      )
                    )
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(255, 247, 203, 7),
                ),
              )],
            ),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
