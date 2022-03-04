import 'package:movie_app/app/module/home/domain/entities/movie.dart';

class MovieMapper {
  static Map<String, dynamic> toMap(Movie movie) {
    return {
      "originalTitle": movie.originalTitle,
      "poster_path": movie.posterPath,
      "vote_average": movie.voteAverage,
      "genre_ids": [],
    };
  }

  static Movie fromMap(Map<String, dynamic> json) {
    return Movie(
      originalTitle: json['original_title'] ?? '',
      posterPath: json['poster_path'] ?? '',
      voteAverage: json["vote_average"].toDouble() ?? 0.0,
      genres: List<int>.from((json["genre_ids"] ?? []).map((x) => x)),
    );
  }
}
