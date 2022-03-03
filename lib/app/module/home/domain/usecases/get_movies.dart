import 'package:movie_app/app/module/home/domain/entities/movie.dart';
import 'package:movie_app/app/module/home/domain/repositories/movie_irepository.dart';

abstract class IGetMovieUsecase {
  Future<List<Movie>> call();
}

class GetMovieUsecase implements IGetMovieUsecase {
  final IMovieRepository repository;

  GetMovieUsecase(this.repository);

  @override
  Future<List<Movie>> call() async {
    return repository.pickUpMovies();
  }
}
