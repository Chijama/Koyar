import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:koyar/firebase_options.dart';

import 'dependencyInj.dart';

class InitializeApp {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await initDependencyInjector();
  }
}
