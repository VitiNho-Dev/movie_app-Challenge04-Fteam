import 'package:dartz/dartz.dart';
import 'package:movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:movie_app/app/modules/home/domain/repositories/movie_repository.dart';

abstract class GetMovieUsecase {
  Future<Either<Failures, List<Movie>>> call();
}

class GetMovieUsecaseImpl implements GetMovieUsecase {
  final MovieRepository repository;

  GetMovieUsecaseImpl(this.repository);

  @override
  Future<Either<Failures, List<Movie>>> call() async {
    return await repository.getMovies();
  }
}
