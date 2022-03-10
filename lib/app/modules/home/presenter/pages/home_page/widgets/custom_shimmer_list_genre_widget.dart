import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListGenreWidget extends StatelessWidget {
  const ShimmerListGenreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
      child: Shimmer.fromColors(
        period: const Duration(minutes: 1),
        baseColor: const Color(0xff12162d),
        highlightColor: Colors.grey.shade300,
        child: Container(
          height: 14,
          width: 60,
          color: Colors.grey,
        ),
      ),
    );
  }
}
