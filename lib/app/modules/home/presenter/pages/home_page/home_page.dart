import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app/app/modules/home/domain/errors/failures.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/triple/home_state.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/triple/home_store.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_app_bar.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_card_movie.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_list_genre_widget.dart';
import 'package:movie_app/app/modules/home/presenter/pages/home_page/widgets/custom_shimmer_list_genre_widget.dart';
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
    // store.observer(
    //   onState: (state) => debugPrint('State ${store.state}'),
    //   onError: (error) => debugPrint('Error $error'),
    //   onLoading: (loading) => debugPrint('Loaging $loading'),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e2440),
      appBar: const CustomAppBar(),
      body: ScopedBuilder<HomeStore, Failures, HomeState>(
        store: store,
        onLoading: (context) => Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        const ShimmerListGenreWidget(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return ShimmerWidget();
              },
            ),
          ],
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
              const SizedBox(height: 8),
              Expanded(
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
              const SizedBox(height: 8),
              Expanded(
                flex: 9,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, top: 8.0, right: 12.0),
                  child: ListView.builder(
                    itemCount: state.listMoviesFiltered.length,
                    itemBuilder: (context, index) {
                      var image = state.listMoviesFiltered[index].posterPath;
                      var name = state.listMoviesFiltered[index].title;
                      var vote = state.listMoviesFiltered[index].voteAverage;
                      return CustomCardMovie(
                        movie: state.listMoviesFiltered[index],
                        image: image,
                        name: name,
                        vote: vote,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
        onError: (context, error) => Text(error.toString()),
      ),
    );
  }
}