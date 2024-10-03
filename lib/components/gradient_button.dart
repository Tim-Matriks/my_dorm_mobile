// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback ontap;
  final String title;
  const GradientButton({
    super.key,
    required this.ontap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: 64,
        decoration: BoxDecoration(
            gradient: kGradientMain, borderRadius: BorderRadius.circular(10)),
        child: Text(
          title,
          style: kBoldTextStyle.copyWith(color: kWhite, fontSize: 16),
        ),
      ),
    );
  }
}
