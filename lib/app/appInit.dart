import 'package:flutter/material.dart';

import 'dependencyInj.dart';

class InitializeApp {
  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initDependencyInjector();
  }
}
