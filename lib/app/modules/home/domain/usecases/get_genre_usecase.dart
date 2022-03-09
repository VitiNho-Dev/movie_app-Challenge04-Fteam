import 'package:movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/modules/home/domain/repositories/genre_repository.dart';

abstract class IGetGenreUsecase {
  Future<List<Genre>> call();
}

class GetGenreUsecase implements IGetGenreUsecase {
  final GenreRepository repository;

  GetGenreUsecase(this.repository);

  @override
  Future<List<Genre>> call() {
    return repository.pickUpGenres();
  }
}
