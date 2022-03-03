import 'package:movie_app/app/module/home/domain/entities/genre.dart';
import 'package:movie_app/app/module/home/domain/repositories/genre_irepository.dart';

abstract class IGetGenreUsecase {
  Future<List<Genre>> call();
}

class GetGenreUsecase implements IGetGenreUsecase {
  final IGenreRepository repository;

  GetGenreUsecase(this.repository);

  @override
  Future<List<Genre>> call() {
    return repository.pickUpGenres();
  }
}
