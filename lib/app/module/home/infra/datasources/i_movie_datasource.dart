import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';

abstract class IMovieDatasource {
  Future<List<Movie>> getMoviesFromNetwork();
}
