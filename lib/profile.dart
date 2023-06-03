import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:womensafety/apiconnection/login.dart';
import 'package:womensafety/login_cred/login_signin.dart';
import 'package:womensafety/main.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController phoneeNumberController = TextEditingController();
  TextEditingController emergencyController = TextEditingController();

  String name = "Harini";
  String emailAddress = "harish.rr.9791@gmail.com";
  String phoneNumber = "9791340230";
  String EmergencyContactNo = "6380956640";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var weight = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.all(50),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                    radius: height * 0.08,
                  ),
                ),
              ),
              header("Name"),
              textfield(name, nameController),
              header("EmailAddress"),
              textfield(emailAddress, emailAddressController),
              header("PhoneNo"),
              textfield(phoneNumber, phoneeNumberController),
              header('Emergency contact info'),
              textfield(EmergencyContactNo, emailAddressController),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        // Update Profile
                      },
                      child: Text("Update Profile")),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Signout
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => myApp()));
                },
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign out",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.exit_to_app)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              circle()
            ],
          ),
        ),
      ),
    );
  }

  Widget header(header) {
    return Padding(
        padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 14),
        child: Text(
          header,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }

  Widget textfield(name, controller) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          hintText: name,
        ),
      ),
    );
  }

  Widget circle() {
    return Container(
      height: 12,
      width: 23,
      decoration: BoxDecoration(shape: BoxShape.circle),
    );
  }
}
