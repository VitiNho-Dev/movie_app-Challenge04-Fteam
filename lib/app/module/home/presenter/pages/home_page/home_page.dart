import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:movie_app/app/module/home/domain/entities/movie.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/triple/home_state.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/triple/home_store.dart';

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
      appBar: AppBar(
        title: const Text('App Movie'),
      ),
      body: ScopedBuilder(
        store: store,
        onState: (context, HomeState state) {
          return Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: state.listGenre.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var genero = state.listGenre[index];
                      return GestureDetector(
                        onTap: () => store.getMovieFiltered(genero.id),
                        child: Container(
                          child: Text('${genero.name}'),
                          color: Colors.blue[50],
                        ),
                      );
                    }),
              ),
              ListView.builder(
                  itemCount: state.listMoviesFiltered.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var movie = state.listMoviesFiltered[index];
                    return GestureDetector(
                      onTap: () {
                        Modular.to
                            .pushNamed('/movieDetailPage', arguments: movie);
                      },
                      child: Container(
                        child: Text('${movie.originalTitle}'),
                        color: Colors.blue[50],
                      ),
                    );
                  }),
            ],
          );
        },
        onError: (context, error) => Text('$error'),
        onLoading: (context) => const CircularProgressIndicator(),
      ),
    );
  }
}
