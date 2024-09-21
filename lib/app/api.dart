import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  // create an instance of Firebase Messaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    // request permission from user
    await _firebaseMessaging.requestPermission();
    // fetch the FCM token for thi device
    final fCMToken = await _firebaseMessaging.getToken();

    // print the token
    debugPrint("Token: $fCMToken");

    // initialise further settings for pushNotifications
    initPushNotifications();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;

    // naVigate to a new screen when user taps notification
    // context.go(BaseRouteName.electionPreferencePage);
  }

  Future initPushNotifications() async {
    // handle notification if the app was terminated
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
