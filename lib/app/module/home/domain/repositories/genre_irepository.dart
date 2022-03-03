import 'package:movie_app/app/module/home/domain/entities/genre.dart';

abstract class IGenreRepository {
  Future<List<Genre>> pickUpGenres();
}
