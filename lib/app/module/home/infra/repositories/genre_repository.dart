import 'package:movie_app/app/module/home/domain/entities/genre.dart';
import 'package:movie_app/app/module/home/domain/repositories/genre_irepository.dart';
import 'package:movie_app/app/module/home/infra/datasources/genre_idatasource.dart';

class GenreRepository implements IGenreRepository {
  final IGenreDatasource datasource;

  GenreRepository(this.datasource);

  @override
  Future<List<Genre>> pickUpGenres() {
    return datasource.getGenreNetwork();
  }
}
