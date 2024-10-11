import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/screens/admin/apps/form/add_paket_page.dart';

class ListPaketPage extends StatelessWidget {
  const ListPaketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      AppBarPage(
        title: 'Paket',
        onAdd: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPaketPage()));
        },
      ),
    ]));
  }
}
