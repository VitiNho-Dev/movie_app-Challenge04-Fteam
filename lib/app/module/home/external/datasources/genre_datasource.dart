import 'package:movie_app/app/module/home/domain/entities/genre.dart';
import 'package:movie_app/app/module/home/external/mappers/genre_mapper.dart';
import 'package:movie_app/app/module/home/infra/datasources/i_genre_datasource.dart';
import 'package:movie_app/app/shared/services/http_iclient.dart';

class GenreDatasource implements IGenreDatasource {
  final IClient client;

  GenreDatasource(this.client);

  @override
  Future<List<Genre>> getGenresFromNetwork() async {
    final response = await client.getNetwork(
        'http://api.themoviedb.org/3/genre/movie/list?api_key=432ad0a10dd3abc7225d168001167d34');
    final data = response.data as Map;
    final result = data["genres"] as List;
    final List<Genre> list = [];
    for (var item in result) {
      list.add(GenreMapper.fromMap(item));
    }
    return list;
  }
}
