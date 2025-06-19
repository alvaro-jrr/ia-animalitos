import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.dev', useConstantCase: true)
abstract class DevEnv {
  @EnviedField()
  static const String baseApiUrl = String.fromEnvironment('BASE_API_URL');
}

@Envied(path: '.env.prod', useConstantCase: true)
abstract class ProdEnv {
  @EnviedField()
  static const String baseApiUrl = String.fromEnvironment('BASE_API_URL');
}
