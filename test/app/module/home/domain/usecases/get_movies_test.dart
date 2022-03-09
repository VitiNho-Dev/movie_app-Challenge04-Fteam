import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/module/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_movies_usecase.dart';

class RepositoryMock extends Mock implements MovieRepository {}

void main() {
  final repository = RepositoryMock();
  final usecase = GetMovieUsecaseImpl(repository);

  final movie = [
    Movie(
      title: 'Fight Club',
      voteAverage: 61.467,
      posterPath: '',
      backdropPath: '',
      overview: '',
      releaseDate: '',
      genres: [],
    ),
  ];

  test('Deve trazer uma lista filme', () async {
    when(() => repository.getMovies())
        .thenAnswer((invocation) async => Right(movie));
    final result = await usecase();
    expect(result, isA<List<Movie>>());
  });
}
