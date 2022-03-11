import 'package:movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/app/modules/home/domain/repositories/genre_repository.dart';
import 'package:movie_app/app/modules/home/infra/datasources/genre_datasource.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreDatasource datasource;
  GenreRepositoryImpl(this.datasource);

  @override
  Future<Either<Failures, List<Genre>>> pickUpGenres() async {
    final result = await datasource.getGenresFromNetwork();
    try {
      return result;
    } on Failures catch (e) {
      MovieDatasourceNoInternetConnection(message: e.toString());
    }
    return result;
  }
}
