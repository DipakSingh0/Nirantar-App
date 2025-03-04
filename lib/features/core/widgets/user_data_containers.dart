/* 
Reusable SUB-SMALL-DATA-CONTAINER widget to display parameters
in Home page
*/
import 'package:flutter/material.dart';

class UserdataContainer extends StatelessWidget {
  final String parameterName;
  final String value;
  final String measure;
  final Icon icon;
  // final double iconSize;

  const UserdataContainer({
    super.key,
    required this.parameterName,
    required this.value,
    required this.measure,
    required this.icon,
    // required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return SafeArea(
      child: Container(
        height: 70,
        width: 75,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 0),
        //-------------- parameter icon and name --------------//
              
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            width: 7,
                            child: icon,
                            
                          ),
                        ),
                        // const SizedBox(
                        //   width: 1,
                        // ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            parameterName,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),

        //-------------- parameter value and measure unit --------------//
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          value,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          measure,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
