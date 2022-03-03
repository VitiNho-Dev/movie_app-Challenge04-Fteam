import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_genre.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_movies.dart';
import 'package:movie_app/app/module/home/external/datasources/genre_datasource.dart';
import 'package:movie_app/app/module/home/external/datasources/movie_datasource.dart';
import 'package:movie_app/app/module/home/infra/repositories/genre_repository.dart';
import 'package:movie_app/app/module/home/infra/repositories/movie_repository.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/home_page.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/triple/home_store.dart';
import 'package:movie_app/app/module/home/presenter/pages/movie_details_page/movie_details_page.dart';
import 'package:uno/uno.dart';

import 'shared/services/http_client_uno.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => Uno()),
        Bind.factory((i) => MovieClientUno(i())),
        Bind.factory((i) => GetMovieUsecase(i())),
        Bind.factory((i) => GetGenreUsecase(i())),
        Bind.factory((i) => MovieDatasource(i())),
        Bind.factory((i) => GenreDatasource(i())),
        Bind.factory((i) => MovieRepository(i())),
        Bind.factory((i) => GenreRepository(i())),
        Bind.factory((i) => HomeStore(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(
          '/movieDetailPage',
          child: (context, args) => MovieDetailPage(
            detailMovie: args.data,
          ),
        ),
      ];
}
