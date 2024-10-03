import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/screens/admin/apps/form/add_keterlambatan_page.dart';

class ListKeterlambatanPage extends StatelessWidget {
  const ListKeterlambatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      AppBarPage(
        title: 'Keterlambatan',
        onAdd: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddKeterlambatanPage()));
        },
      ),
    ]));
  }
}
