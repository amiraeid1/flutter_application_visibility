import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import 'local/shared_pref_local_storage_caller.dart';
import 'main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({
    Key? key,
  }) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void didChangeDependencies() async {
    Future.delayed(const Duration(seconds:3), () async {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      final SharedPrefsLocalStorageCaller shared =
          SharedPrefsLocalStorageCaller(sharedPreferences: sharedPreferences);

      await shared
          .restoreUserData(
        key: 'user',
      )
          .then((user) {
        // debugPrint('user=$user');
        if (user != null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Homescreen()),
              (route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => login()),
              (route) => false);
        }
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
          "https://png.pngtree.com/png-clipart/20230328/original/pngtree-international-women-s-day-8-march-with-frame-of-flower-and-png-image_9006378.png"),
    );
  }
}
