import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/form_drop_down.dart';
import 'package:my_dorm/components/form_photo_picker.dart';
import 'package:my_dorm/components/form_textfield.dart';
import 'package:my_dorm/components/gradient_button.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/service/http_service.dart';
import 'package:my_dorm/service/online_notification_service.dart';

class AddPelanggaranPage extends StatefulWidget {
  final List<Map<String, dynamic>> dormitizenDataList;

  const AddPelanggaranPage({super.key, required this.dormitizenDataList});
  
  @override
  State<AddPelanggaranPage> createState() => _AddPelanggaranPageState();
}

class _AddPelanggaranPageState extends State<AddPelanggaranPage> {
  final TextEditingController _kategoriController = TextEditingController();
  // final TextEditingController _kamarController = TextEditingController();
  final TextEditingController _waktuController = TextEditingController();
  final TextEditingController _gambarController = TextEditingController();
  final TextEditingController _dormitizenIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String error = "";
  bool _showSpinner = false;

  Future<void> _addPelanggaran() async {
    error = "";
    setState(() {
      _showSpinner = true;
    });
    Map<String, dynamic> response = {};
    try {
      Map<String, dynamic> data = {
        'kategori': _kategoriController.text,
        'waktu': _waktuController.text,
        'gambar': _gambarController.text,
        'dormitizenId': int.parse(_dormitizenIdController.text),
      };
      String? token = await getToken();
      response = await postDataToken("/pelanggaran", data, token!);
      print('berhasil tambah laporan!');
      if (mounted) {
        Navigator.pop(context, 'sesuatu');
      }
      print(response['message']);
    } catch (e) {
      setState(() {
        _showSpinner = false;
        error = "${response['message']}";
      });
      print('Login error: $e');
      print(response);
    }
    setState(() {
      _showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          const AppBarPage(title: 'Tambah Pelanggaran'),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      // const FormPhotoPicker(title: 'Bukti Gambar'),
                      const FormDropDown(
                        title: 'Nama Dormitizen',
                        kategoriItems: [
                          
                          // tambahkan kategori lain sesuai kebutuhan
                        ],
                      ),
                      const FormDropDown(
                        title: 'Kategori',
                        kategoriItems: [
                          'merokok',
                          'membuang sampah sembarangan',
                          'tidak mengikuti peraturan',
                          // tambahkan kategori lain sesuai kebutuhan
                        ],
                      ),
                      FormTextField(
                        label: 'Waktu Pelanggaran',
                        controller: _waktuController,
                        // hintText: 'yyyy-mm-dd hh:mm:ss',
                      ),
                      FormTextField(
                        label: 'Gambar Bukti',
                        controller: _gambarController,
                        // hintText: 'Nama gambar (misal: gambar-bukti.jpg)',
                      ),
                      FormTextField(
                        label: 'Dormitizen ID',
                        controller: _dormitizenIdController,
                        // hintText: 'ID Dormitizen',
                      ),
                      GradientButton(
                        ontap: _addPelanggaran,
                        title: 'Tambah Pelanggaran',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
