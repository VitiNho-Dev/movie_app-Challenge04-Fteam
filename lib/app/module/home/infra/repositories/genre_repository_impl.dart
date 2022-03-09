import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/module/home/domain/repositories/genre_repository.dart';
import 'package:movie_app/app/module/home/infra/datasources/genre_datasource.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreDatasource datasource;

  GenreRepositoryImpl(this.datasource);

  @override
  Future<List<Genre>> pickUpGenres() {
    return datasource.getGenresFromNetwork();
  }
}
