import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  const GameOver({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 120, 254),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 120, 254),
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
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 60, minWidth: 50),
              child: ElevatedButton.icon(
                label: Text(''),
                icon: Icon(Icons.arrow_forward),
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 247, 203, 7),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
