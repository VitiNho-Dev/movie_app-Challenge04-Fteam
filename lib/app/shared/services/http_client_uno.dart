import 'dart:developer';
import 'dart:io';

import 'package:movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:movie_app/app/shared/services/http_iclient.dart';
import 'package:uno/uno.dart';

class MovieClientUno implements IClient {
  final Uno uno;

  MovieClientUno(this.uno);
  @override
  Future<Response> getNetwork(String url) async {
    log(url);
    try {
      final Response response = await uno.get(url);
      return response;
    } on SocketException catch (e) {
      log(e.message);
      throw MovieDatasourceNoInternetConnection(
        message: '',
      );
    } on UnoError catch (e) {
      // log(e.response!.headers.toString());
      log(e.request!.responseType.name);
      log(e.data.toString());
      throw MovieDatasourceNoInternetConnection(
        message: 'Sem conexão',
      );
    }
  }
}
