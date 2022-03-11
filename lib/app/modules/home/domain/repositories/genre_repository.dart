import 'package:movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/app/modules/home/domain/errors/failures.dart';

abstract class GenreRepository {
  Future<Either<Failures, List<Genre>>> pickUpGenres();
}
