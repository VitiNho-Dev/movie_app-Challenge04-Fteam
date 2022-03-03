import 'package:uno/uno.dart';

abstract class IClient {
  Future<Response> getNetwork(String url);
}
