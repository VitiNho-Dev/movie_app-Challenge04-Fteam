import 'package:flutter/material.dart';
import 'package:movie_app/app/module/home/domain/entities/movie.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.detailMovie})
      : super(key: key);

  final Movie detailMovie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(detailMovie.originalTitle),
      ),
    );
  }
}
