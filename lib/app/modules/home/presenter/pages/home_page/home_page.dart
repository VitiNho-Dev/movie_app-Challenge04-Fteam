import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app/app/modules/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/triple/home_state.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/triple/home_store.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_app_bar.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_card_movie.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_list_genre_widget.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_shimmer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();
  int indexSelected = 0;

  @override
  void initState() {
    super.initState();
    store.getMovie();
    store.getGenre();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e2440),
      appBar: CustomAppBar(
        onChanged: (value) {
          store.getMovieSearch(value);
        },
      ),
      body: ScopedBuilder<HomeStore, Failures, HomeState>(
        store: store,
        onLoading: (context) => ShimmerWidget(),
        onError: (context, error) => const Center(
          child: Text(
            'Sem conexão',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onState: (context, HomeState state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.listGenre.length,
                    itemBuilder: (context, index) {
                      var genre = state.listGenre[index];
                      return CustomListGenre(
                        name: genre.name,
                        isActive: indexSelected == index,
                        onTap: () {
                          store.getMovieFiltered(genre.id);
                          setState(() {
                            indexSelected = index;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    top: 8.0,
                    right: 12.0,
                  ),
                  child: ListView.builder(
                    itemCount: state.listMoviesFiltered.length,
                    itemBuilder: (context, index) {
                      Movie movie = state.listMoviesFiltered[index];
                      return CustomCardMovie(
                        tag: 'item-${movie.id}',
                        movie: movie,
                        image: movie.posterPath,
                        name: movie.title,
                        vote: movie.voteAverage,
                        onTap: () {
                          Modular.to
                              .pushNamed('/movieDetailPage', arguments: movie);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
