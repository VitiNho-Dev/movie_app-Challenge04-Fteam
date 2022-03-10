import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:movie_app/app/modules/home/domain/usecases/get_genre_usecase.dart';
import 'package:movie_app/app/modules/home/domain/usecases/get_movies_usecase.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/triple/home_state.dart';

class HomeStore extends NotifierStore<Failures, HomeState> {
  final GetMovieUsecase movieUsecase;
  final IGetGenreUsecase genreUsecase;

  HomeStore(this.movieUsecase, this.genreUsecase) : super(const HomeState());

  Future<void> getMovie() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 10));
    final response = await movieUsecase();
    response.fold(
      (l) => setError(MovieDatasourceNoInternetConnection()),
      (r) {
        update(state.copyWith(
          listMovies: r,
          listMoviesFiltered: r,
        ));
      },
    );
    setLoading(false);
  }

  Future<void> getMovieFiltered(int id) async {
    setLoading(true);
    try {
      if (id == -1) {
        update(state.copyWith(
          listMoviesFiltered: state.listMovies,
        ));
        setLoading(false);
        return;
      }
      final listFiltered = state.listMovies.where(
        (element) => element.genres.contains(id),
      );
      update(state.copyWith(
        listMoviesFiltered: listFiltered.toList(),
      ));
    } on Failures catch (e) {
      setError(MovieDatasourceNoInternetConnection(
        message: e.toString(),
      ));
    }
    setLoading(false);
  }

  Future<void> getGenre() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 10));
    try {
      final response = await genreUsecase();
      update(
          state.copyWith(listGenre: [Genre(id: -1, name: 'All'), ...response]));
    } on Failures catch (e) {
      setError(MovieDatasourceNoInternetConnection(
        message: e.toString(),
      ));
    }
    setLoading(false);
  }

  Future<void> searchMovie(String text) async {
    setLoading(true);
    final response = await movieUsecase();
    final result = response.map((e) => e);
    final movie = response.fold(
      (l) => MovieDatasourceNoInternetConnection(),
      (r) => result,
    );
    setLoading(false);
  }
}
