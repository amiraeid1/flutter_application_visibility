import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';

class Pageone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3syc7--wHSQ2PqM8mcu2KKzqgiOwXyOfzLy8Ih7d8NDtYKoPTCocGgNRxFRO5-_qRg6o&usqp=CAU")),
    );
  }
}

class Pagetwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3syc7--wHSQ2PqM8mcu2KKzqgiOwXyOfzLy8Ih7d8NDtYKoPTCocGgNRxFRO5-_qRg6o&usqp=CAU")
        ],
      ),
    ));
  }
}

class Fordrawer extends StatelessWidget {
  const Fordrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3syc7--wHSQ2PqM8mcu2KKzqgiOwXyOfzLy8Ih7d8NDtYKoPTCocGgNRxFRO5-_qRg6o&usqp=CAU")
                ],
              ),
              const ListTile(leading: Icon(Icons.home), title: Text("home")),
              const ListTile(
                  leading: Icon(Icons.access_alarm), title: Text("alarm")),
              const ListTile(leading: Icon(Icons.chat), title: Text("chat")),
              const Expanded(
                  child: Align(
                alignment: FractionalOffset.bottomLeft,
                child: ListTile(
                  leading: Icon(Icons.arrow_back),title: Text("back"),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
