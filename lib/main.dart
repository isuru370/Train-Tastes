import 'package:firebase_core/firebase_core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

import 'app/app.dart';
import 'core/di/injection.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();

  runApp(const TrainTastesApp());
}
