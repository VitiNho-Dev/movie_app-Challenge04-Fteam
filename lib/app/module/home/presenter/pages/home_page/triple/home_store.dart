import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_genre_usecase.dart';
import 'package:movie_app/app/module/home/domain/usecases/get_movies_usecase.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/triple/home_state.dart';

class HomeStore extends NotifierStore<Exception, HomeState> {
  final IGetMovieUsecase movieUsecase;
  final IGetGenreUsecase genreUsecase;

  HomeStore(this.movieUsecase, this.genreUsecase) : super(const HomeState());

  Future<void> getMovie() async {
    setLoading(true);
    try {
      final response = await movieUsecase();
      update(state.copyWith(
        listMovies: response,
        listMoviesFiltered: response,
      ));
    } on Exception catch (e) {
      setError(e);
    }
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
    } on Exception catch (e) {
      setError(e);
    }
    setLoading(false);
  }

  Future<void> getGenre() async {
    setLoading(true);
    try {
      final response = await genreUsecase();
      update(
          state.copyWith(listGenre: [Genre(id: -1, name: 'All'), ...response]));
    } on Exception catch (e) {
      setError(e);
    }
    setLoading(false);
  }
}
