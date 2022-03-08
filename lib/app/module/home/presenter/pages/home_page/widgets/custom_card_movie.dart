import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:movie_app/app/module/home/domain/entities/movie_entity.dart';
import 'package:movie_app/app/module/home/presenter/pages/home_page/controllers/change_color.dart';

class CustomCardMovie extends StatelessWidget {
  const CustomCardMovie({
    Key? key,
    required this.image,
    required this.name,
    required this.vote,
    required this.movie,
    this.height = 130,
  }) : super(key: key);

  final String image;
  final String name;
  final double vote;
  final Movie movie;
  final double height;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final controller = ChangeColor();
    return ValueListenableBuilder<bool>(
      valueListenable: controller,
      builder: (context, active, child) {
        return InkWell(
          onTap: () {
            Modular.to.pushNamed('/movieDetailPage', arguments: movie);
          },
          child: Container(
            width: double.infinity,
            height: height,
            margin: const EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff12162d),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                      ),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original$image',
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress?.cumulativeBytesLoaded ==
                              loadingProgress?.expectedTotalBytes) {
                            return child;
                          }
                          return const SizedBox(
                            height: 50,
                            width: 50,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 12),
                    Padding(
                      padding: const EdgeInsets.only(top: 14),
                      child: Column(
                        children: [
                          SizedBox(
                            width: size.width * 0.5,
                            child: Text(
                              name,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: controller.changeColor,
                      padding: EdgeInsets.zero,
                      icon: active
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                            ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        '$vote',
                        textScaleFactor: 0.8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
