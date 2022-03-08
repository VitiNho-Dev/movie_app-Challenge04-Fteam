import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/app/module/home/domain/entities/genre.dart';
import 'package:movie_app/app/module/home/infra/datasources/i_genre_datasource.dart';
import 'package:movie_app/app/module/home/infra/repositories/genre_repository.dart';

class GenreDatasourceMock extends Mock implements IGenreDatasource {}

class GenreMapperMock extends Mock implements Genre {}

void main() {
  final datasource = GenreDatasourceMock();
  final repository = GenreRepository(datasource);
  final List<Genre> genreMapper = [GenreMapperMock()];

  test('Deve retornar um medelo dos Generos', () async {
    when(() => datasource.getGenresFromNetwork())
        .thenAnswer((_) async => genreMapper);
    final result = await repository.pickUpGenres();
    expect(result, isA<List<Genre>>());
    expect(result.length, 1);
  });
}
