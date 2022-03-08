import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/module/home/domain/repositories/i_genre_repository.dart';

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
