import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/appInit.dart';

void main() async {
  await InitializeApp.init();
  runApp(AppRoot());
}

// import 'package:flutter/material.dart';
// import 'package:koyar/presentation/features/voter%20regeriatration%20check/voterRegistrationCheckPage.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Your app name',
//       home:  VoterRegistrationCheckPage()
//     );
//   }
// }