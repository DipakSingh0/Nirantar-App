/* 
Reusable container widget to display parameters
in Users page
*/
import 'package:flutter/material.dart';

class UserdataContainer extends StatelessWidget {
  final String parameterName;
  final String value;
  final String measure;
  final Icon icon;
  final Color containerColor;

  const UserdataContainer({
    super.key,
    required this.parameterName,
    required this.value,
    required this.measure,
    required this.icon,
    required this.containerColor,

  });

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return Container(
      height: 42,
      width: 50,
      decoration: BoxDecoration(
        // color: theme.cardTheme.color,
        color: containerColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 3),
                  //------------icon and parameter Row-------------------//
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: 35,
                          child: icon,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          parameterName,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  //------------Value Row-------------------//
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        value,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        measure,
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  fontSize: 25,
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
    );
  }
}
