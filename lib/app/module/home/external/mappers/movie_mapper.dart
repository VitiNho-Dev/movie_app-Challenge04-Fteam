import 'package:movie_app/app/module/home/domain/entities/movie.dart';

class MovieMapper {
  static Map<String, dynamic> toMap(Movie movie) {
    return {
      "originalTitle": movie.originalTitle,
      "popularity": movie.popularity,
      "genre_ids": [],
    };
  }

  static Movie fromMap(Map<String, dynamic> json) {
    return Movie(
      originalTitle: json['original_title'] ?? '',
      popularity: json['popularity'] ?? '',
      genres: List<int>.from((json["genre_ids"] ?? []).map((x) => x)),
    );
  }
}
