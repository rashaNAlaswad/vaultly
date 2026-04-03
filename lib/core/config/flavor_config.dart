enum Flavor { development, production }

class FlavorConfig {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
  );

  final Flavor flavor;
  final String name;

  FlavorConfig._({required this.flavor, required this.name});

  static FlavorConfig? _instance;
  static FlavorConfig get instance => _instance!;

  static bool get isDev => _instance?.isDevelopment ?? false;

  static void setup({required Flavor flavor}) {
    _instance = FlavorConfig._(flavor: flavor, name: flavor.name);
  }

  bool get isDevelopment => flavor == Flavor.development;
  bool get isProduction => flavor == Flavor.production;
}
