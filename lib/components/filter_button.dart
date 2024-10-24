import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';

class FilterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: kBlueGrey, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Icon(Icons.filter_alt_outlined));
  }
}
