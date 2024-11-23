import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';
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
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
        child: Row(
          children: [
            Expanded(
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
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kGrey),
                ),
                child: Icon(Icons.filter_alt)),
          ],
        ),
      ),
      ShadowContainer(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              child: Column(
                children: [
                  Image.asset('images/paket.png'),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    decoration: BoxDecoration(
                        color: kRed, borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Belum Diambil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.close,
                          color: kWhite,
                          size: 16,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'nama',
                  style: kBoldTextStyle.copyWith(fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: kRed,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'pos',
                      style: TextStyle(color: kRed, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'owner',
                      style: kSemiBoldTextStyle,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timelapse,
                      size: 16,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('date'),
                  ],
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Icon(Icons.edit), Icon(Icons.delete)],
              ),
            )
          ],
        ),
      )
    ]));
  }
}
