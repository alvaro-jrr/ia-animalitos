import 'package:ai_animals_lottery/src/core/env/env.dart';

/// The flavor of the app.
enum Flavor {
  development,
  production;

  /// Returns the flavor from string.
  static Flavor fromString(String input) {
    return switch (input) {
      'development' => Flavor.development,
      'production' => Flavor.production,
      _ => Flavor.production,
    };
  }

  /// Wether is development flavor.
  bool get isDevelopment => this == Flavor.development;

  /// Wether is production flavor.
  bool get isProduction => this == Flavor.production;
}

/// The flavor settings.
class FlavorSettings {
  /// The flavor.
  final Flavor flavor;

  /// The flavor values.
  final FlavorValues values;

  /// The instance of the flavor settings.
  static FlavorSettings get instance => _instance;

  static late final FlavorSettings _instance;

  FlavorSettings._internal({required this.flavor, required this.values});

  /// Returns the instance of the flavor settings.
  factory FlavorSettings({
    required Flavor flavor,
    required FlavorValues values,
  }) {
    _instance = FlavorSettings._internal(flavor: flavor, values: values);

    return _instance;
  }

  /// Returns the settings for the given [flavor].
  factory FlavorSettings.fromFlavor(Flavor flavor) {
    return switch (flavor) {
      Flavor.development => FlavorSettings(
        flavor: flavor,
        values: FlavorValues(baseApiUrl: DevEnv.baseApiUrl),
      ),
      Flavor.production => FlavorSettings(
        flavor: flavor,
        values: FlavorValues(baseApiUrl: ProdEnv.baseApiUrl),
      ),
    };
  }
}

/// The dynamic values for the flavor.
class FlavorValues {
  /// The base API URL.
  final String baseApiUrl;

  const FlavorValues({required this.baseApiUrl});
}
