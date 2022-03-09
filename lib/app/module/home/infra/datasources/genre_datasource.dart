import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';

abstract class GenreDatasource {
  Future<List<Genre>> getGenresFromNetwork();
}
