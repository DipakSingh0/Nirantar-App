import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 75,
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: const Text(
              ' N O T I F I C A T I O N S',
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
                  child: Text("Notifications Page",
                      style: Theme.of(context).textTheme.bodyLarge)),
            ],
          )),
    );
  }
}
