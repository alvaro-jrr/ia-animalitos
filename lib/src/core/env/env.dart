import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env.dev', useConstantCase: true)
abstract class DevEnv {
  @EnviedField()
  static const String baseApiUrl = _DevEnv.baseApiUrl;
}

@Envied(path: '.env.prod', useConstantCase: true)
abstract class ProdEnv {
  @EnviedField()
  static const String baseApiUrl = _ProdEnv.baseApiUrl;
}
