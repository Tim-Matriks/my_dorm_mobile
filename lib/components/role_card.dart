import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';

class RoleCard extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String title;
  const RoleCard({
    super.key,
    required this.width,
    required this.height,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.52,
      height: width * 0.52,
      color: kWhite.withOpacity(0.2),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: width * 0.28,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: kMediumTextStyle.copyWith(color: kWhite, fontSize: 16),
          )
        ],
      ),
    );
  }
}
