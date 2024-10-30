import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/constant/constant.dart';

class ListKamarPageAdmin extends StatefulWidget {
  const ListKamarPageAdmin({super.key});

  @override
  State<ListKamarPageAdmin> createState() => _ListKamarPageAdminState();
}

class _ListKamarPageAdminState extends State<ListKamarPageAdmin> {
  int _selectedIndex = 0;
  List<Map> listKamar = [
    {'nomor': 101, 'ada': true},
    {'nomor': 102, 'ada': true},
    {'nomor': 103, 'ada': false},
    {'nomor': 104, 'ada': true},
    {'nomor': 105, 'ada': true},
    {'nomor': 106, 'ada': true},
    {'nomor': 107, 'ada': true},
    {'nomor': 108, 'ada': false},
    {'nomor': 109, 'ada': true},
    {'nomor': 110, 'ada': true},
    {'nomor': 111, 'ada': false},
    {'nomor': 112, 'ada': true},
    {'nomor': 113, 'ada': true},
    {'nomor': 114, 'ada': false},
    {'nomor': 115, 'ada': true},
    {'nomor': 116, 'ada': true},
    {'nomor': 117, 'ada': false},
    {'nomor': 118, 'ada': true},
    {'nomor': 119, 'ada': true},
    {'nomor': 120, 'ada': true},
    {'nomor': 121, 'ada': true},
    {'nomor': 122, 'ada': false},
    {'nomor': 123, 'ada': true},
    {'nomor': 124, 'ada': true},
  ];

  //TODO: jadikan datanya lengkap tiap lantai, namun mungkin taro di file lain agar tidak penuh disini

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarPage(
            title: 'Kamar',
            canBack: false,
          ),
          SizedBox(height: 10),
          Container(
            height: 630,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                itemCount: 4,
                itemBuilder: (context, pageIndex) {
                  int floorNumber = pageIndex + 1;
                  return Column(children: [
                    Text(
                      'Lantai $floorNumber',
                      style: kBoldTextStyle.copyWith(fontSize: 24),
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: GridView.count(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          crossAxisCount: 4,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          children: List.generate(24, (index) {
                            return Center(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: (listKamar[index]['ada'])
                                        ? kRed
                                        : kGray,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: Text(
                                  '${listKamar[index]['nomor']}',
                                  textAlign: TextAlign.center,
                                  style: kBoldTextStyle.copyWith(
                                      fontSize: 24, color: kWhite),
                                )),
                              ),
                            );
                          })),
                    ),
                  ]);
                }),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => AnimatedContainer(
                  margin: const EdgeInsets.only(right: 6),
                  height: 5,
                  width: (index == _selectedIndex) ? 25 : 12,
                  decoration: BoxDecoration(
                      color: (index == _selectedIndex)
                          ? Colors.black.withOpacity(0.75)
                          : Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(2.5)),
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.easeInOutQuint,
                ),
              ))
        ],
      ),
    );
  }
}
