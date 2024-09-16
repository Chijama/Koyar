import 'package:flutter/material.dart';

import 'app/app.dart';
import 'app/appInit.dart';

void main() async {
  await InitializeApp.init();
  runApp(AppRoot());
}
