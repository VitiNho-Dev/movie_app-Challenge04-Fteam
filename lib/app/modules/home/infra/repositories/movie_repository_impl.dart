import 'package:movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/app/modules/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/app/modules/home/infra/datasources/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<Either<Failures, List<Movie>>> getMovies() async {
    return await datasource.getMoviesFromNetwork();
  }
}
