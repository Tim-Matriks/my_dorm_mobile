import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';

class ListStatistikPage extends StatelessWidget {
  const ListStatistikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      AppBarPage(
        title: 'Statistik',
        onAdd: () {},
      ),
    ]));
  }
}
