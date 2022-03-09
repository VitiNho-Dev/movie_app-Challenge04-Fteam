import 'package:movie_app/app/modules/home/domain/entities/genre_entity.dart';

abstract class GenreDatasource {
  Future<List<Genre>> getGenresFromNetwork();
}
