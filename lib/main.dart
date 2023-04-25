import 'package:flutter/material.dart';
import 'package:flutter_application_visibility/login.dart';
import 'package:flutter_application_visibility/splashscreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'classes.dart';

void main() {
  runApp(ProviderScope(child: myapp()));
}

class myapp extends StatelessWidget {
  myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home:splashscreen());
  }
}

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => homescreenstate();
}

class homescreenstate extends State<Homescreen> {
  int selectedIndex = 0; // variable store data int
  List<Widget> widgetpages = [Pageone(), Pagetwo()]; // pages
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Fordrawer(),
      body: widgetpages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex, //
          onTap: (index) {
            // user index tap
            setState(() {
              selectedIndex = index; // store user index to variable
            });

            print(selectedIndex);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc_sharp), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.abc_rounded), label: "school")
          ]),
      appBar: AppBar(
        title: const Text("home"),
      ),
    );
  }
}
