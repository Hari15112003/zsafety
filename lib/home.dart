import 'package:flutter/material.dart';
import 'map.dart';
import 'const.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var name = 'Harish';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: backgroundColor,
        padding: EdgeInsets.only(
            top: height * 0.02, left: width * 0.03, right: width * 0.03),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.menu_open_rounded,
                    size: width * 0.075,
                    color: textColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hello, $name!',
                      style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.bold,
                          color: textColor),
                    ),
                    Text(
                      'Be secured by using ZSAFETY',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.035,
                          color: textColor.withOpacity(.6)),
                    )
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/profile.jpg")),
                      shape: BoxShape.circle,
                      border: Border.all(color: textColor)),
                )
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: textColor.withOpacity(.1)),
              ),
              width: width * 0.8,
              height: height * 0.4,
              child: MapScreen(),
            )
          ],
        )),
      ),
    );
  }
}
