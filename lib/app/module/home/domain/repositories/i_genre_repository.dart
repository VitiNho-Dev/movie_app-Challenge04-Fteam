import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';

abstract class IGenreRepository {
  Future<List<Genre>> pickUpGenres();
}
