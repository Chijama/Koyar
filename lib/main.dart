// import 'package:flutter/material.dart';

// import 'app/app.dart';
// import 'app/appInit.dart';

// void main() async {
//   await InitializeApp.init();
//   runApp(AppRoot());
// }

import 'package:flutter/material.dart';
import 'package:koyar/presentation/features/votersGuide/votersGuide.dart';
 

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'Your app name', home: VotingGuidesScreen());
  }
}
