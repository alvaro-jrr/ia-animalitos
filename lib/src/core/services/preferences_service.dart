import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static final _instance = PreferencesService._internal();

  PreferencesService._internal();

  factory PreferencesService() => _instance;

  /// The preferences instance.
  late SharedPreferences preferences;

  /// Initializes the preferences service.
  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  /// Gets the string value from the preferences.
  String? getString(String key) {
    try {
      return preferences.getString(key);
    } catch (e) {
      return null;
    }
  }

  /// Sets the string value in the preferences.
  Future<bool> setString(String key, String value) {
    return preferences.setString(key, value);
  }
}
