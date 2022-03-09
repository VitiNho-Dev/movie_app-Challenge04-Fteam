import 'package:movie_app/app/module/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Failures, List<Movie>>> getMovies();
}
