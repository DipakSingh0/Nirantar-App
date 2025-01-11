import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0.1,
      thickness: 1.2,
      color: Colors.grey.shade300,
    );
  }
}
