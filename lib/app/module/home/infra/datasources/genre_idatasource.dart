import 'package:movie_app/app/module/home/domain/entities/genre.dart';

abstract class IGenreDatasource {
  Future<List<Genre>> getGenreNetwork();
}
