import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 75,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: const Text(
              'S e t t i n g s',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Center(
                  child: Text("SettingsPage",
                      style: Theme.of(context).textTheme.bodyLarge)),
            ],
          )),
    );
  }
}
