import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../my_app.dart';
import 'flavor_config.dart';

class AppInitializer {
  static Future<void> initializeApp({required bool isDevelopment}) async {
    WidgetsFlutterBinding.ensureInitialized();

    FlavorConfig.setup(
      flavor: isDevelopment ? Flavor.development : Flavor.production,
    );
    
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp(const MyApp());
  }
}
