import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/module/home/domain/repositories/i_movie_repository.dart';
import 'package:movie_app/app/module/home/infra/datasources/i_movie_datasource.dart';

class MovieRepository implements IMovieRepository {
  final IMovieDatasource datasource;
  MovieRepository(this.datasource);

  @override
  Future<List<Movie>> pickUpMovies() {
    return datasource.getMoviesFromNetwork();
  }
}
