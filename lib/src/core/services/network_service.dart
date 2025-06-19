import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class NetworkService {
  /// Whether the device has internet connection.
  static Future<bool> hasConnection() {
    return InternetConnection().hasInternetAccess;
  }
}
