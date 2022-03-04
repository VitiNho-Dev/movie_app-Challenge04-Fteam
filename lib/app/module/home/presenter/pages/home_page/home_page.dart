import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/triple/home_state.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/triple/home_store.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/widgets/custom_app_bar.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/widgets/custom_card_movie.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/widgets/custom_list_genre.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = Modular.get<HomeStore>();

  @override
  void initState() {
    super.initState();
    store.getMovie();
    store.getGenre();
    store.observer(
      onState: (state) => debugPrint('State $state'),
      onError: (error) => debugPrint('Error $error'),
      onLoading: (loading) => debugPrint('Loaging $loading'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e2440),
      appBar: const CustomAppBar(),
      body: ScopedBuilder(
        store: store,
        onState: (context, HomeState state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
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
                flex: 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.listMoviesFiltered.length,
                  itemBuilder: (context, index) {
                    var genre = state.listGenre[index];
                    return CustomListGenre(
                      store: store,
                      genre: genre,
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: state.listMovies.length,
                    itemBuilder: (context, index) {
                      var image = state.listMovies[index].posterPath;
                      var name = state.listMovies[index].originalTitle;
                      var vote = state.listMovies[index].voteAverage;
                      return CustomCardMovie(
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
        onError: (context, error) => Text('$error'),
        onLoading: (context) => const CircularProgressIndicator(),
      ),
    );
  }
}
