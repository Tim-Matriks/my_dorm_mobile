import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/paket_card.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/screens/admin/apps/form/add_paket_page.dart';
import 'package:my_dorm/service/http_service.dart';

class ListPaketPage extends StatefulWidget {
  const ListPaketPage({super.key});

  @override
  State<ListPaketPage> createState() => _ListPaketPageState();
}

class _ListPaketPageState extends State<ListPaketPage> {
  List<Map<String, dynamic>> pakets = [];
  String error = "";
  // ignore: unused_field
  bool _showSpinner = false;

  @override
  void initState() {
    super.initState();
    getPaket();
  }

  String formatTanggal(String tanggal) {
    DateTime dateTime = DateTime.parse(tanggal).toLocal();
    return DateFormat('dd MMM yyyy, HH:mm').format(dateTime);
  }

  Future<void> getPaket() async {
    error = "";
    setState(() {
      _showSpinner = true;
    });
    try {
      String? token = await getToken();
      var response = await getDataToken('/paket/all', token!);
      if (response['data'] != null) {
        setState(() {
          pakets = (response['data'] as List)
              .map((item) => item as Map<String, dynamic>)
              .toList();
        });
        print('Data Paket: $pakets');
      } else {
        setState(() {
          error = "Data paket dormitizen kosong.";
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _showSpinner = false;
        error = "Error: $e";
      });
    }
  }
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
      Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Daftar Paket :',
                    style: kBoldTextStyle.copyWith(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: List.generate(
                        pakets.length,
                        (index) => PaketCard(
                              paketSampai:
                                  '${formatTanggal(pakets[index]['waktu_tiba'])} (Paket Sampai)',
                              paketDiambil: pakets[index]['status_pengambilan'] == 'sudah' ? '${formatTanggal(pakets[index]['waktu_diambil'])} (Paket Diambil)' : '-' ,
                              namaDormitizen: pakets[index]['dormitizen']
                                  ['nama'],
                              status: pakets[index]['status_pengambilan'],
                              pjPaket: '${pakets[index]['penerima paket']['nama']} (Pj Paket)',
                            )),
                  ),
                ],
              ),
            ),
      
    ]));
  }
}
