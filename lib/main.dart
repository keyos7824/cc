import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'features/app/app.dart';
import 'services/api.dart';
import 'services/storage.dart';

ObservableMap user = ObservableMap();

// reprendre
Future<void> init() async {
  api = Api();
  // Pour stocket les information localement de maniere chiffrée
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  storage = Storage('secureKey', prefs);
}

Future<void> main() async {
  // storage febore run
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(App());
} 