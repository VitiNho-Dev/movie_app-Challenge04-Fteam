import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/app/module/home/domain/entities/movie.dart';
import 'package:movie_app/app/module/home/domain/repositories/movie_irepository.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_movies.dart';

class RepositoryMock extends Mock implements IMovieRepository {}

void main() {
  final repository = RepositoryMock();
  final usecase = GetMovieUsecase(repository);

  final movie = [
    Movie(
      originalTitle: 'Fight Club',
      popularity: 61.467,
      genres: [],
    ),
  ];

  test('Deve trazer uma lista filme', () async {
    when(() => repository.pickUpMovies())
        .thenAnswer((invocation) async => movie);
    final result = await usecase();
    expect(result, isA<List<Movie>>());
  });
}
