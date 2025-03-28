import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/screens/admin/apps/form/add_pelanggaran_page.dart';
import 'package:my_dorm/service/http_service.dart';
import 'package:my_dorm/service/image_service.dart';

class ListPelanggaranPage extends StatefulWidget {
  const ListPelanggaranPage({super.key});

  @override
  State<ListPelanggaranPage> createState() => _ListPelanggaranPageState();
}

class _ListPelanggaranPageState extends State<ListPelanggaranPage> {
  List<Map<String, dynamic>> pelanggarans = [];
  String error = "";
  bool _showSpinner = false;

  @override
  void initState() {
    super.initState();
    getPelanggaran();
  }

  String formatTanggal(String tanggal) {
    DateTime dateTime = DateTime.parse(tanggal).toLocal();
    return DateFormat('dd MMM yyyy, HH:mm').format(dateTime);
  }

  Future<void> getPelanggaran() async {
    error = "";
    setState(() {
      _showSpinner = true;
    });
    try {
      String? token = await getToken();
      var response = await getDataToken('/pelanggaran', token!);
      List<Map<String, dynamic>> parsedData = (response['data'] as List)
          .map((item) => item as Map<String, dynamic>)
          .toList();
      print(response);
      setState(() {
        pelanggarans = parsedData;
      });
    } catch (e) {
      print(e);
      setState(() {
        error = "Error: $e";
      });
    } finally {
      setState(() {
        _showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBarPage(
            title: 'Daftar Pelanggaran',
            onAdd: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddPelanggaranPage(
                      // Kirim semua data hasil pencarian
                      ),
                ),
              );
            },
          ),
          if (_showSpinner)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: CircularProgressIndicator(
                color: kMain,
              )),
            )
          else if (error.isNotEmpty)
            Center(
              child: Text(
                error,
                style: kMediumTextStyle.copyWith(color: Colors.red),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: pelanggarans.length,
                itemBuilder: (context, index) {
                  final pelanggaran = pelanggarans[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ShadowContainer(
                      onTap: () {},
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: MyNetworkImage(
                              imageURL:
                                  'https://mydorm-mobile-backend-production.up.railway.app/images/${pelanggaran['gambar']}',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Informasi Pelanggaran
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kategori: ${pelanggaran['kategori']}',
                                  style: kBoldTextStyle.copyWith(fontSize: 16),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Nama: ${pelanggaran['dormitizen']['nama']}',
                                  style:
                                      kMediumTextStyle.copyWith(fontSize: 15),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Waktu: ${formatTanggal(pelanggaran['waktu'])}',
                                  style: kMediumTextStyle.copyWith(
                                      fontSize: 14, color: kGrey),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Kamar: ${pelanggaran['dormitizen']['kamar']['nomor']}',
                                  style: kMediumTextStyle.copyWith(
                                      fontSize: 14, color: kGrey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
