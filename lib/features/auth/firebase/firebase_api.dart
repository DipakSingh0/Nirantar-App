// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:nira/main.dart';
// // import 'package:projet/main.dart';

// class FirebaseApi {
//   //creating an instance of Ifrebase messaging
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   //function to initialize notification
//   Future<void> initNotifications() async {
//     //request permission from user (will prompt user)
//     await _firebaseMessaging.requestPermission();

//     //fetch the FCM token for this device
//     final fCMToken = await _firebaseMessaging.getToken();

//     //print the token (normally you would send this to your server)
//     // ignore: avoid_print
//     print('Token: $fCMToken');

//     // initialize further settings for  push notificaion
//     initPushNotifications();
//   }

//   //function to handle received message
//   void handleMessage(RemoteMessage? message) {
//     //if the message is null , do nothing
//     if (message == null) return;

//     //navigate to new screen when message is received and user taps notification
//     navigatorKey.currentState?.pushNamed(
//       '/notification_page',
//       arguments: message,
//     );
//   }

//   //functioin to initialize backgrouond steting
//   Future initPushNotifications() async {
//     //handle notification if the app was terminated and now opened
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

//     //attach event listeners for when a notification oepns the app
//     FirebaseMessaging.onMessage.listen(handleMessage);
//   }
  
// }
