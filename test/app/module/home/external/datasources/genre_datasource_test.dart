import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/module/home/external/datasources/genre_datasource_impl.dart';
import 'package:movie_app/app/shared/services/http_iclient.dart';
import 'package:uno/uno.dart';

import '../../../../../utils/result_genre.dart';

class UnoClientMock extends Mock implements IClient {}

void main() {
  final client = UnoClientMock();
  final datasource = GenreDatasourceImpl(client);

  test('Deve retornar a lista de Generos', () async {
    when(() => client.getNetwork(any())).thenAnswer(
      (_) async => Response(
          headers: {},
          request: Request(
              uri: Uri(),
              method: 'GET',
              timeout: const Duration(),
              headers: {}),
          status: 200,
          data: resultGenre),
    );
    final result = await datasource.getGenresFromNetwork();
    expect(result, isA<List<Genre>>());
  });
}
