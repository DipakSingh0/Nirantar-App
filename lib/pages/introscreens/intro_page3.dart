import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    Size screenSize = MediaQuery.of(context).size;
    
       double aspectRatio = 16 / 9; 
       return SafeArea(
         child: Container(
          width: screenSize.width,
          height: screenSize.height /aspectRatio,
          // height: screenSize.height,
               decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/intro3.jpeg'),
            fit: BoxFit.cover,
          ),
               ),
             ),
       );
  }
}