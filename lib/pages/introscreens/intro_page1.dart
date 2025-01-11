import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});



  @override
  Widget build(BuildContext context) {

     // Getting the screen size for flexible Ui
    Size screenSize = MediaQuery.of(context).size;
    double aspectRatio = 16 / 9; // width / height
    return  SafeArea(
      child: Container(
        width: screenSize.width,
        height: screenSize.width / aspectRatio, 
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('lib/assets/intro1.jpeg'),
          fit: BoxFit.cover,
          ),
          
        ),
        // color: Colors.blue,
      ),
    );
  }
}