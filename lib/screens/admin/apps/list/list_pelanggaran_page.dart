import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/screens/admin/apps/form/add_pelanggaran_page.dart';
import 'package:my_dorm/screens/admin/apps/form/search_kamar_to_add_pelanggaran.dart';
import 'package:my_dorm/service/http_service.dart';

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
                    builder: (context) => const SearchKamarToAddPelanggaran()),
              );
            },
          ),
          if (_showSpinner)
            const Center(child: CircularProgressIndicator())
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
                      onTap: () {
                        // Tambahkan aksi ketika item diklik
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gambar Lokal Menggunakan Image.asset
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'images/bukti_pelanggaran.png',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.image_not_supported),
                                );
                              },
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
                                  style:
                                      kBoldTextStyle.copyWith(fontSize: 16),
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
