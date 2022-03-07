import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomAppBarDetailsPage extends StatelessWidget
    implements PreferredSizeWidget {
  final String urlImage;

  const CustomAppBarDetailsPage({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(urlImage),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              tileMode: TileMode.decal,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Color(0xff1e2440),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: IconButton(
            onPressed: () {
              Modular.to.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 180);
}
