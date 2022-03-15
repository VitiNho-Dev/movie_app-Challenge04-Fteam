import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app/app/modules/home/domain/entities/genre_entity.dart';
import 'package:movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:movie_app/app/modules/home/domain/usecases/get_genre_usecase.dart';
import 'package:movie_app/app/modules/home/domain/usecases/get_movies_usecase.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/triple/home_state.dart';

class HomeStore extends NotifierStore<Failures, HomeState> {
  final IGetGenreUsecase genreUsecase;
  final GetMovieUsecase movieUsecase;

  HomeStore(this.genreUsecase, this.movieUsecase) : super(const HomeState());

  Future<void> getMovie() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 5));
    final response = await movieUsecase();
    response.fold(
      (l) => setError(l),
      (r) {
        update(state.copyWith(
          listMovies: r,
          listMoviesFiltered: r,
        ));
      },
    );
    setLoading(false);
  }

  Future<void> getMovieSearch(String title) async {
    setLoading(true);
    try {
      if (title == '') {
        update(state.copyWith(
          listMoviesFiltered: state.listMovies,
        ));
        setLoading(false);
        return;
      }
      final listFiltered = state.listMovies.where(
        (element) => element.title.contains(title),
      );
      update(state.copyWith(
        listMoviesFiltered: listFiltered.toList(),
      ));
    } on Failures catch (e) {
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
    } on Failures catch (e) {
      setError(e);
    }
    setLoading(false);
  }

  Future<void> getGenre() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 5));
    final response = await genreUsecase();
    response.fold(
      (l) => setError(l),
      (r) {
        update(
          state.copyWith(
            listGenre: [Genre(id: -1, name: 'All'), ...r],
          ),
        );
      },
    );
    setLoading(false);
  }
}
