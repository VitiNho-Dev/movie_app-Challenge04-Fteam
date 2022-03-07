import 'package:flutter/material.dart';
import 'package:movie_app/app/module/home/domain/entities/genre.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/controllers/change_color.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/triple/home_store.dart';

class CustomListGenre extends StatelessWidget {
  const CustomListGenre({
    Key? key,
    required this.store,
    required this.genre,
  }) : super(key: key);

  final HomeStore store;
  final Genre genre;

  @override
  Widget build(BuildContext context) {
    final controller = ChangeColor();
    return ValueListenableBuilder<bool>(
      valueListenable: controller,
      builder: (context, active, child) {
        return InkWell(
          onTap: () {
            controller.changeColor;
            store.getMovieFiltered(genre.id);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: active ? const Color(0xff3d57bc) : const Color(0xff12162d),
            ),
            child: Text(
              genre.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
