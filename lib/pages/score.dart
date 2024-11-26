import 'package:flutter/material.dart';
import 'package:quizmania/pages/home.dart';
import 'package:quizmania/pages/options.dart';

class Score extends StatelessWidget {
  const Score({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Final Score',
                style: TextStyle(fontSize: 28),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: Text(
                  'Total Score: ',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: SizedBox(
                width: 200,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 4.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 203, 7),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()))
                          },
                          icon: Icon(
                            Icons.home_outlined,
                            size: 35,
                          ),
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        IconButton(
                            onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OptionsPage()))
                                },
                            icon: Icon(
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
