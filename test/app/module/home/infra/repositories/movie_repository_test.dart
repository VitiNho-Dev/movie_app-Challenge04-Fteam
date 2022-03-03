import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/app/module/home/domain/entities/movie.dart';
import 'package:movie_app/app/module/home/infra/datasources/movie_idatasource.dart';
import 'package:movie_app/app/module/home/infra/repositories/movie_repository.dart';

class MovieDatasourceMock extends Mock implements IMovieDatasource {}

class MovieMapperMock extends Mock implements Movie {}

void main() {
  final datasource = MovieDatasourceMock();
  final repository = MovieRepository(datasource);
  final List<Movie> movieMapper = [MovieMapperMock()];

  test('Deve retornar uma lista de filmes', () async {
    when(() => datasource.getMovieNetwork())
        .thenAnswer((invocation) async => movieMapper);
    final result = await repository.pickUpMovies();
    expect(result, isA<List<Movie>>());
    expect(result.length, 1);
  });
}
