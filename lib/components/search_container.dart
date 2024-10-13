import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';

class SearchBox extends StatelessWidget {
  final String placehold;

  const SearchBox({
    super.key,
    required this.placehold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: kBlueGrey, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: this.placehold,
            prefixIcon: Icon(Icons.search),
            prefixIconColor: kBlueGrey),
      ),
    );
  }
}
