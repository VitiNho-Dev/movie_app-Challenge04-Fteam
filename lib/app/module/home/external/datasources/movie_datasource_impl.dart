import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/module/home/domain/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/app/module/home/infra/datasources/movie_datasource.dart';
import 'package:movie_app/app/module/home/external/mappers/movie_mapper.dart';
import 'package:movie_app/app/shared/services/http_iclient.dart';

class MovieDatasourceImpl implements MovieDatasource {
  final IClient client;

  MovieDatasourceImpl(this.client);

  @override
  Future<Either<Failures, List<Movie>>> getMoviesFromNetwork() async {
    try {
      final response = await client.getNetwork(
          'http://api.themoviedb.org/3/movie/popular?api_key=432ad0a10dd3abc7225d168001167d34');
      final data = response.data as Map;
      final results = data['results'] as List;
      final List<Movie> list = [];
      for (final item in results) {
        list.add(MovieMapper.fromMap(item));
      }
      return Right(list);
    } on Failures catch (e) {
      return Left(InvalidTextError(messageError: e.toString()));
    }
  }
}
