import 'package:movie_app/app/module/home/domain/entities/movie.dart';

abstract class IMovieDatasource {
  Future<List<Movie>> getMovieNetwork();
}
