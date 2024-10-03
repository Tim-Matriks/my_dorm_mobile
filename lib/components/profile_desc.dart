// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';

class ProfileDesc extends StatelessWidget {
  final String title;
  final String value;
  const ProfileDesc({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: Text(
            '$title :',
            style: kSemiBoldTextStyle.copyWith(fontSize: 14, color: kWhite),
          )),
          Expanded(
              child: Text(
            value,
            textAlign: TextAlign.end,
            style: kSemiBoldTextStyle.copyWith(fontSize: 14, color: kWhite),
          )),
        ],
      ),
    );
  }
}
