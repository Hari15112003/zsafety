// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import '../apiconnection/login.dart';
import '../apiconnection/signup.dart';
import '../home.dart';
import 'localStorage.dart';

class login_signin extends StatefulWidget {
  final String todo;

  const login_signin({super.key, required this.todo});

  @override
  State<login_signin> createState() => _login_signinState();
}

class _login_signinState extends State<login_signin> {
  static const volunter = "volunter";
  static const women = "women";
  static const police = "police";
  var currentUser = volunter;
  bool todo = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      todo = widget.todo == 'login';
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top + height * 0.03,
              left: width * 0.09,
              right: width * 0.09),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: width * 0.12,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 234, 234, 234),
                    border:
                        Border.all(color: Color.fromARGB(255, 191, 191, 191)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(child: Icon(Icons.arrow_back_rounded)),
                ),
              ),
              SizedBox(height: height * 0.03),
              Container(
                width: width * 0.8,
                child: Text(
                  todo
                      ? 'Welcome Back! Let`s be secured and keep others secure!'
                      : 'Kindly create an account to join the secure society!'
                          .toUpperCase(),
                  style: TextStyle(
                      fontFamily: 'Junge',
                      wordSpacing: 6,
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 53, 53, 53)),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  selecter(
                    width: width,
                    height: height,
                    user: volunter,
                  ),
                  selecter(
                    width: width,
                    height: height,
                    user: women,
                  ),
                  selecter(
                    width: width,
                    height: height,
                    user: police,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.05,
              ),
              !todo
                  ? TextField(
                      controller: nameController,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 53, 53, 53)),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15),
                        hintText: 'ENTER YOUR NAME',
                        hintStyle: TextStyle(
                            letterSpacing: 1.5,
                            wordSpacing: 3,
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 169, 169, 169)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 78, 78, 78),
                                width: 2),
                            borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 155, 155, 155)),
                            borderRadius: BorderRadius.circular(12)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    )
                  : SizedBox(),
              SizedBox(
                height: height * 0.02,
              ),
              TextField(
                controller: emailController,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 53, 53, 53)),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15),
                  hintText: 'ENTER YOUR EMAIL',
                  hintStyle: TextStyle(
                    letterSpacing: 1.5,
                    wordSpacing: 3,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 169, 169, 169),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 78, 78, 78), width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 155, 155, 155)),
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              TextField(
                controller: passwordController,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color.fromARGB(255, 53, 53, 53)),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15),
                  hintText: 'ENTER YOUR PASSWORD',
                  hintStyle: TextStyle(
                      letterSpacing: 1.5,
                      wordSpacing: 3,
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 169, 169, 169)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 78, 78, 78), width: 2),
                      borderRadius: BorderRadius.circular(12)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 155, 155, 155)),
                      borderRadius: BorderRadius.circular(12)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  Spacer(),
                  Text(
                    'Forget the Password',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 190, 152, 252)),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GestureDetector(
                onTap: () async {
                  if (todo) {
                    final result = await loginUser(emailController.text.trim(),
                        passwordController.text.trim());
                    if (result == 'success') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home()));
                      saveUserDetails(emailController.text.trim(),
                          passwordController.text.trim());
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    }
                  } else {
                    final result = await signupUser(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        nameController.text.trim());
                    if (result == 'success') {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home()));
                      saveUserDetails(emailController.text.trim(),
                          passwordController.text.trim());
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(result)));
                    }
                  }
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: width * 0.6,
                    padding: EdgeInsets.symmetric(vertical: height * 0.01),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        !todo ? 'Signin' : 'Login',
                        style: TextStyle(
                            fontSize: width * 0.05,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 3,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.grey])),
                  ),
                  Text(
                    'OR LOGIN WITH',
                    style: TextStyle(
                        fontFamily: 'Acme', fontSize: 14, color: Colors.grey),
                  ),
                  Container(
                    height: 3,
                    width: width * 0.25,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: LinearGradient(
                            colors: [Colors.grey, Colors.white])),
                  )
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    todo
                        ? 'Dont have an Account?  '
                        : 'Already have an Account?  ',
                    style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () => setState(() {
                      todo = !todo;
                    }),
                    child: Text(
                      todo ? 'Signin' : 'login',
                      style: TextStyle(
                          fontSize: width * 0.05,
                          letterSpacing: 1,
                          color: Color.fromARGB(255, 190, 152, 252),
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Acme'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector selecter(
      {required double width, required double height, required String user}) {
    bool selectedUser = currentUser == user;
    return GestureDetector(
      onTap: () => setState(() {
        currentUser = user;
      }),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        decoration: BoxDecoration(
          color: selectedUser
              ? Color.fromARGB(255, 0, 0, 0)
              : Color.fromARGB(255, 234, 234, 234),
          border: Border.all(
              color: selectedUser
                  ? Color.fromARGB(255, 80, 80, 80)
                  : Color.fromARGB(255, 168, 168, 168)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            user,
            style: TextStyle(
                color: selectedUser ? Colors.white : Colors.black,
                fontSize: width * 0.04,
                fontWeight: FontWeight.w400,
                fontFamily: 'Acme'),
          ),
        ),
      ),
    );
  }
}
