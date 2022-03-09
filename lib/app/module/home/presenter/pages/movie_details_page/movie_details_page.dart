import 'package:flutter/material.dart';
import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/module/home/presenter/pages/movie_details_page/widgets/custom_app_bar.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.detailMovie})
      : super(key: key);

  final Movie detailMovie;

  @override
  Widget build(BuildContext context) {
    // TODO: adcionar um scroll na pagina
    return Scaffold(
      backgroundColor: const Color(0xff1e2440),
      appBar: CustomAppBarDetailsPage(
        urlImage:
            'https://image.tmdb.org/t/p/original/${detailMovie.backdropPath}',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              const SizedBox(height: 12),
              Center(
                child: Text(
                  detailMovie.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      detailMovie.releaseDate,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '${detailMovie.voteAverage}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.star_rounded,
                          color: Colors.yellow[600],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 36),
              Text(
                detailMovie.overview,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: 200,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        decoration: BoxDecoration(
          color: Colors.yellow[600],
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Save',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
