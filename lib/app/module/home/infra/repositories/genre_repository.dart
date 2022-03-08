import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/module/home/domain/repositories/i_genre_repository.dart';
import 'package:movie_app/app/module/home/infra/datasources/i_genre_datasource.dart';

class GenreRepository implements IGenreRepository {
  final IGenreDatasource datasource;

  GenreRepository(this.datasource);

  @override
  Future<List<Genre>> pickUpGenres() {
    return datasource.getGenresFromNetwork();
  }
}
