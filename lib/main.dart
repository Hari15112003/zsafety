import 'package:flutter/material.dart';
import 'home.dart';
import 'login_cred/localStorage.dart';
import 'login_cred/mlog.dart';

late bool togo = false;
Future main() async {
  runApp(myApp());
  togo = await checkUserLoggedIn();
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    final togoWidget = togo ? home() : const mlog();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: togoWidget,
    );
  }
}
