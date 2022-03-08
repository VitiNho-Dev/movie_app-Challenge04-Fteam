import 'package:movie_app/app/module/home/domain/entities/genre_entity.dart';

class GenreMapper {
  static Genre fromMap(Map<String, dynamic> json) {
    return Genre(
      id: json["id"],
      name: json["name"],
    );
  }
}
