import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../my_app.dart';
import 'flavor_config.dart';

class AppInitializer {
  static Future<void> initializeApp({required bool isDevelopment}) async {
    WidgetsFlutterBinding.ensureInitialized();

    FlavorConfig.setup(
      flavor: isDevelopment ? Flavor.development : Flavor.production,
    );

    await Supabase.initialize(
      url: FlavorConfig.supabaseUrl,
      anonKey: FlavorConfig.supabasePublishableKey,
    );

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp(const ProviderScope(child: MyApp()));
  }
}
