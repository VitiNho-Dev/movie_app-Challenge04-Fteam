import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/module/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/app/module/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/app/module/home/infra/datasources/movie_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<Either<Failures, List<Movie>>> getMovies() {
    return datasource.getMoviesFromNetwork();
  }
}
