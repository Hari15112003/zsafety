// ignore_for_file: prefer_const_constructors

import '/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'login_signin.dart';

class mlog extends StatefulWidget {
  const mlog({super.key});

  @override
  State<mlog> createState() => _mlogState();
}

class _mlogState extends State<mlog> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: width,
        padding: EdgeInsets.only(top: height * 0.08),
        decoration: BoxDecoration(color: Color.fromARGB(255, 240, 240, 240)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LottieBuilder.asset(
              'assets/json/login.json',
              height: height * 0.45,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Image.asset(
              'assets/images/logo.png',
            ),
            Text(
              'Let`s Secure',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Acme'),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 600),
                  reverseTransitionDuration: Duration(milliseconds: 600),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      FadeTransition(
                    opacity: CurvedAnimation(
                        parent: animation, curve: Interval(0, 0.5)),
                    child: login_signin(
                      todo: "login",
                    ),
                  ),
                ),
              ),
              child: Container(
                margin:
                    EdgeInsets.only(top: height * 0.02, bottom: height * 0.01),
                width: width * 0.7,
                padding: EdgeInsets.symmetric(vertical: height * 0.015),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                    color: Colors.black),
                child: Center(
                    child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 22,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: Duration(seconds: 2),
                  reverseTransitionDuration: Duration(milliseconds: 600),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      login_signin(todo: 'signin'))),
              child: Container(
                width: width * 0.7,
                padding: EdgeInsets.symmetric(vertical: height * 0.015),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white),
                child: Center(
                  child: Text(
                    'Signin',
                    style: TextStyle(
                        fontSize: 22,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
          ],
        ),
      ),
    );
  }
}
