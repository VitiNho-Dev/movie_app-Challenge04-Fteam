import 'package:movie_app/app/module/home/domain/entities/movie.dart';

class MovieMapper {
  static Map<String, dynamic> toMap(Movie movie) {
    return {
      "title": movie.title,
      "poster_path": movie.posterPath,
      "backdrop_path": movie.backdropPath,
      "overview": movie.overview,
      "release_date": movie.releaseDate,
      "vote_average": movie.voteAverage,
      "genre_ids": [],
    };
  }

  static Movie fromMap(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      overview: json['overview'] ?? '',
      releaseDate: json['release_date'] ?? '',
      voteAverage: json["vote_average"].toDouble() ?? 0.0,
      genres: List<int>.from((json["genre_ids"] ?? []).map((x) => x)),
    );
  }
}
