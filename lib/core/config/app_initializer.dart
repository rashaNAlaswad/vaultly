import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../my_app.dart';
import '../providers/shared_preferences_provider.dart';
import 'flavor_config.dart';

class AppInitializer {
  static Future<void> initializeApp({required bool isDevelopment}) async {
    WidgetsFlutterBinding.ensureInitialized();

    FlavorConfig.setup(
      flavor: isDevelopment ? Flavor.development : Flavor.production,
    );

    final prefs = await SharedPreferences.getInstance();

    await Supabase.initialize(
      url: FlavorConfig.supabaseUrl,
      anonKey: FlavorConfig.supabasePublishableKey,
    );

    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    runApp(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const MyApp(),
      ),
    );
  }
}
