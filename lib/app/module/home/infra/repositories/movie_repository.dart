import 'package:movie_app/app/module/home/domain/entities/movie.dart';
import 'package:movie_app/app/module/home/domain/repositories/movie_irepository.dart';
import 'package:movie_app/app/module/home/infra/datasources/movie_idatasource.dart';

class MovieRepository implements IMovieRepository {
  final IMovieDatasource datasource;
  MovieRepository(this.datasource);

  @override
  Future<List<Movie>> pickUpMovies() {
    return datasource.getMovieNetwork();
  }
}
