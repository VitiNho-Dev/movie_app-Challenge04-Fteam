import '../entities/movie_entity.dart';

abstract class IMovieRepository {
  Future<List<Movie>> pickUpMovies();
}
