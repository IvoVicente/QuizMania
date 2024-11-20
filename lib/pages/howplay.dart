import 'package:flutter/material.dart';
import 'package:quizmania/pages/home.dart';

class HowPlay extends StatelessWidget {
  const HowPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 160, 252),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 160, 252),
        leading: IconButton(
          icon: const Icon(
            Icons.home_outlined,
            size: 40,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'How to play',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Text(
                    '1. Select one option',
                    style: TextStyle(fontSize: 14),
                  ),
                ))
              ]),
              const SizedBox(
                height: 24,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Text(
                    '2. Click “Confim”',
                    style: TextStyle(fontSize: 14),
                  ),
                )),
              ]),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      '3. If you run out of time you lose',
                      style: TextStyle(fontSize: 14),
                    ),
                  ))
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(children: <Widget>[
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Text(
                    '4. Skip the questions 3 times if you need',
                    style: TextStyle(fontSize: 14),
                  ),
                ))
              ]),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      '5. Good luck and have some fun! :)',
                      style: TextStyle(fontSize: 14),
                    ),
                  ))
                ],
              ),
            ]),
      ),
    );
  }
}
