import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/components/log_box.dart';

class ListRiwayatRequestPage extends StatelessWidget {
  const ListRiwayatRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      AppBarPage(
        title: 'Riwayat Request',
        onAdd: () {},
      ),
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kBlueGrey, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Cari Riwayat log',
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: kBlueGrey),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kBlueGrey, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(Icons.filter_alt_outlined)),
          ],
        ),
      ),
      LogBox(nama: "Iksan", type: "In", onAccept: () {}, onReject: () {})
    ]));
  }
}
