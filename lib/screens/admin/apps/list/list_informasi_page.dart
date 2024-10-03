import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';

class ListInformasiPage extends StatelessWidget {
  const ListInformasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(children: [
      AppBarPage(title: 'Informasi', onAdd: (){},),
    ]));
  }
}
