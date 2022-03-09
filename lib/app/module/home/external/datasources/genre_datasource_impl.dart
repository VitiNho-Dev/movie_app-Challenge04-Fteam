import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/module/home/external/mappers/genre_mapper.dart';
import 'package:movie_app/app/module/home/infra/datasources/genre_datasource.dart';
import 'package:movie_app/app/shared/services/http_iclient.dart';

class GenreDatasourceImpl implements GenreDatasource {
  final IClient client;

  GenreDatasourceImpl(this.client);

  @override
  Future<List<Genre>> getGenresFromNetwork() async {
    final response = await client.getNetwork(
        'http://api.themoviedb.org/3/genre/movie/list?api_key=432ad0a10dd3abc7225d168001167d34');
    final data = response.data as Map;
    final result = data['genres'] as List;
    final List<Genre> list = [];
    for (var item in result) {
      list.add(GenreMapper.fromMap(item));
    }
    return list;
  }
}
