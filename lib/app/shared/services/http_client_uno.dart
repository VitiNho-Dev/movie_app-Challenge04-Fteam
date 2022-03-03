import 'package:movie_app/app/shared/services/http_iclient.dart';
import 'package:uno/uno.dart';

class MovieClientUno implements IClient {
  final Uno uno;

  MovieClientUno(this.uno);
  @override
  Future<Response> getNetwork(String url) async {
    final Response response = await uno.get(url);
    return response;
  }
}
