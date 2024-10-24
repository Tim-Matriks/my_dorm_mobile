import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/constant/constant.dart';

class ListInformasiPage extends StatelessWidget {
  const ListInformasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      AppBarPage(
        title: 'Informasi',
        onAdd: () {},
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 9,
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kGrey),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Cari')
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kGrey),
                  ),
                  child: Icon(Icons.filter_alt)),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              gradient: kGradientBlue, borderRadius: BorderRadius.circular(10)),
        ),
        // TODO: Melengkapi isi card
      )
    ]));
  }
}
