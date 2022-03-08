import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/module/home/external/datasources/movie_datasource.dart';
import 'package:movie_app/app/shared/services/http_iclient.dart';
import 'package:uno/uno.dart';

import '../../../../../utils/result_movie.dart';

class UnoClientMock extends Mock implements IClient {}

void main() {
  final client = UnoClientMock();
  final datasource = MovieDatasource(client);

  test('deve retornar a lista de filmes', () async {
    when((() => client.getNetwork(any()))).thenAnswer(
      (_) async => Response(
          headers: {},
          request: Request(
              uri: Uri(),
              method: 'GET',
              timeout: const Duration(),
              headers: {}),
          status: 200,
          data: resultMovies),
    );
    final result = await datasource.getMoviesFromNetwork();
    expect(result, isA<List<Movie>>());
  });
}
