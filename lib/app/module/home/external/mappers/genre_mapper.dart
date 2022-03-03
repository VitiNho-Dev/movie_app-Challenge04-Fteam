import 'package:movie_app/app/module/home/domain/entities/genre.dart';

class GenreMapper {
  static Map<String, dynamic> toMap(Genre genre) {
    return {
      "id": genre.id,
      "name": genre.name,
    };
  }

  static Genre fromMap(Map<String, dynamic> json) {
    return Genre(
      id: json["id"],
      name: json["name"],
    );
  }
}
