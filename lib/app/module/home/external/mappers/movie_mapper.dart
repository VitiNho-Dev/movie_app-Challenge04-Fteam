import 'package:movie_app/app/module/home/domain/entities/movie.dart';

class MovieMapper {
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
