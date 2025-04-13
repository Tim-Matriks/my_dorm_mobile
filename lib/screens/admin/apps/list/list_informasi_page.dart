import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/screens/admin/apps/form/add_informasi_page.dart';
import 'package:my_dorm/service/http_service.dart';
import 'package:my_dorm/service/image_service.dart';

class ListInformasiPage extends StatefulWidget {
  const ListInformasiPage({super.key});

  @override
  State<ListInformasiPage> createState() => _ListInformasiPageState();
}

class _ListInformasiPageState extends State<ListInformasiPage> {
  List<Map<String, dynamic>> beritas = [];
  String error = "";
  bool _showSpinner = false;
  @override
  void initState() {
    super.initState();
    getBerita();
  }

  Future<void> getBerita() async {
    error = "";
    setState(() {
      _showSpinner = true;
    });
    try {
      String? token = await getToken();
      var response = await getDataToken('/berita', token!);
      List<Map<String, dynamic>> parsedData = (response['data'] as List)
          .map((item) => item as Map<String, dynamic>)
          .toList();
      print(response);
      setState(() {
        beritas = parsedData;
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
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Column(
          children: [
            AppBarPage(
              title: 'Informasi',
              onAdd: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddInformasiPage(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kGrey),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 5),
                          Text('Cari')
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kGrey),
                    ),
                    child: const Icon(Icons.filter_alt),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: beritas.length,
                itemBuilder: (context, index) {
                  final item = beritas[index];
                  return Card(
                    color: kWhite,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage: AssetImage(
                                    'images/zee.png'), // ganti path jika perlu
                                radius: 20,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('ayay',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(item['updated_at'] ?? 'error',
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item['judul'] ?? 'error',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            item['isi'] ?? 'error',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Text(
                            'Baca Selengkapnya',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: MyNetworkImage(
                              imageURL:
                                  'https://mydorm-mobile-backend-production.up.railway.app/images/${item['gambar']}',
                              width: double.infinity,
                              fit: BoxFit.cover,
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
      ),
    );
  }
}
