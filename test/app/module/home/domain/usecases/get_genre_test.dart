import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/module/home/domain/repositories/genre_repository.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_genre_usecase.dart';

class RepositoryMock extends Mock implements GenreRepository {}

void main() {
  final repository = RepositoryMock();
  final datasource = GetGenreUsecase(repository);

  final genre = [
    Genre(
      id: 10,
      name: 'Ação',
    ),
  ];

  test('Deve retornar uma lista de Generos de Filmes', () async {
    when(() => repository.pickUpGenres())
        .thenAnswer((invocation) async => genre);
    final result = await datasource.call();
    expect(result, isA<List<Genre>>());
  });
}
