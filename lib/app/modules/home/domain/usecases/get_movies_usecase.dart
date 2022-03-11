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
    final result = await repository.getMovies();
    try {
      return result;
    } on Failures catch (e) {
      MovieDatasourceNoInternetConnection(message: e.toString());
    }
    return result;
  }
}
