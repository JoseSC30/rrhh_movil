import 'package:flutter/material.dart';

import 'main.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Bienvenido Usuario"),
          SizedBox(
            height: 50,
          ),
          OutlinedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MainPage()));
              },
              icon: Icon(
                Icons.exit_to_app,
                size: 18,
              ),
              label: Text("Logout")),
        ],
      ),
    )));
  }
}
