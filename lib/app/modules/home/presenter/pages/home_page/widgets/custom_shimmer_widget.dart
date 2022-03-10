import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;

  ShimmerWidget({
    Key? key,
    this.height = 130,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xff12162d),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Shimmer.fromColors(
        period: const Duration(minutes: 1),
        baseColor: const Color(0xff12162d),
        highlightColor: Colors.grey.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 130,
                  width: 86,
                  color: Colors.grey,
                ),
                const SizedBox(width: 12),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Column(
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        child: Container(
                          height: 20,
                          width: 130,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
