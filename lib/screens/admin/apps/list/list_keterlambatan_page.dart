import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/keterlambatan_box.dart';
import 'package:my_dorm/models/keterlambatan_model.dart';
import 'package:my_dorm/screens/admin/apps/form/add_keterlambatan_page.dart';

class ListKeterlambatanPage extends StatelessWidget {
  const ListKeterlambatanPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<KeterlambatanModel> keterlambatan = [
      KeterlambatanModel(
          name: "Rakha Galih Nugraha Sukma",
          reason:
              "Saya sedang ada kesibukan menjadi panitia Championship Regeneration 2024.",
          date: DateTime.now()),
      KeterlambatanModel(
          name: "Muhammad Dias Adani",
          reason: "Saya sedang ada kesibukan kerja kelompok bersama teman.",
          date: DateTime.now()),
      KeterlambatanModel(
          name: "Iksan Oktav Risandy",
          reason:
              "Saya malam ini sibuk mengurus finansial perlombaan LIDM 2024.",
          date: DateTime.now()),
    ];

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
      SizedBox(height: 20),
      Column(
          children: List.generate(
              keterlambatan.length,
              (index) => KeterlambatanBox(
                    nama: keterlambatan[index].name,
                    reason: keterlambatan[index].reason,
                    date: keterlambatan[index].date,
                  )))
    ]));
  }
}
