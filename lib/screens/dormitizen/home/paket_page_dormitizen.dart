import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_home.dart';
import 'package:my_dorm/components/paket_card.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/models/paket_model.dart';

class PaketPageDormitizen extends StatelessWidget {
  const PaketPageDormitizen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PaketModel> pakets = [
      PaketModel(namaBarang: 'Nama Barang', time: DateTime(2023, 9, 7, 19)),
      PaketModel(namaBarang: 'Nama Barang', time: DateTime(2023, 11, 6, 20))
    ];
    return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Stack(children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(gradient: kGradientMain),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('images/bg-asrama-wide.png',
                      width: double.infinity, fit: BoxFit.cover),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppBarHome(
                      titleContent: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Paket kamu akan',
                            style: kSemiBoldTextStyle.copyWith(
                                color: kWhite, fontSize: 15),
                          ),
                          Text(
                            'Teracatat di sini!',
                            style: kSemiBoldTextStyle.copyWith(
                                color: kWhite, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cari Paket :',
                            style: kSemiBoldTextStyle.copyWith(
                                fontSize: 14, color: kWhite),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: kBlueGrey, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Nama Barang',
                                  prefixIcon: Icon(Icons.search),
                                  prefixIconColor: kBlueGrey),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Paket belum diambil :',
                    style: kBoldTextStyle.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(
                        pakets.length,
                        (index) => PaketCard(
                              namaBarang: pakets[index].namaBarang,
                              time: pakets[index].time,
                              edit: false,
                              namaDormitizen: 'Iksan',
                            )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Riwayat Paket :',
                    style: kBoldTextStyle.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(
                        pakets.length,
                        (index) => PaketCard(
                              namaBarang: pakets[index].namaBarang,
                              time: pakets[index].time,
                              edit: false,
                              namaDormitizen: 'Iksan',
                            )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
