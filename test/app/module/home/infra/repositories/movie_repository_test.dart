import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/module/home/infra/datasources/movie_datasource.dart';
import 'package:movie_app/app/module/home/infra/repositories/movie_repository_impl.dart';

class MovieDatasourceMock extends Mock implements MovieDatasource {}

class MovieMapperMock extends Mock implements Movie {}

void main() {
  final datasource = MovieDatasourceMock();
  final repository = MovieRepositoryImpl(datasource);
  final List<Movie> movieMapper = [MovieMapperMock()];

  test('Deve retornar uma lista de filmes', () async {
    when(() => datasource.getMoviesFromNetwork())
        .thenAnswer((invocation) async => Right(movieMapper));
    final result = await repository.getMovies();
    final value = result.fold(id, id);
    expect(value, isA<List<Movie>>());
  });
}
