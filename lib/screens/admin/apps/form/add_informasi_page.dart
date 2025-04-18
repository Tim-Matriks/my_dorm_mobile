import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/form_drop_down.dart';
import 'package:my_dorm/components/form_photo_picker.dart';
import 'package:my_dorm/components/form_textfield.dart';
import 'package:my_dorm/components/gradient_button.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/service/http_service.dart';
import 'package:my_dorm/service/online_notification_service.dart';

class AddInformasiPage extends StatefulWidget {
  const AddInformasiPage({super.key});

  @override
  State<AddInformasiPage> createState() => _AddInformasiPageState();
}

class _AddInformasiPageState extends State<AddInformasiPage> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  
  File? gambar;
  String? selectedKategori;

  String error = "";
  bool _showSpinner = false;

  Future<void> _addPelanggaran() async {
    error = "";
    setState(() {
      _showSpinner = true;
    });
    dynamic response = {};
    try {
      Map<String, String> data = {
        'kategori': selectedKategori!,
      };
      response = await postDataTokenWithImage("/berita", data, gambar);
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
          const AppBarPage(title: 'Tambah Informasi'),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    FormPhotoPicker(
                      title: 'informasi',
                      onImageSelected: (selectedImage) {
                        // Handle the selected image here
                        if (selectedImage != null) {
                          print('Selected image path: ${selectedImage.path}');
                        } else {
                          print('Image cleared');
                        }
                      },
                    ),
                    FormDropDown(
                        title: 'Kategori',
                        kategoriItems: const [
                          'fasilitas asrama',
                          'event asrama',
                          'lingkungan asrama',
                          'peraturan asrama',
                        ],
                        onItemSelected: (selectedItem) {
                          // Handle the selected item here
                          print('Selected item: $selectedItem');
                        }),
                    FormTextField(label: 'Judul', controller: _judulController),
                    FormTextField(
                      label: 'Deskripsi',
                      controller: _deskripsiController,
                      minLines: 3,
                    ),
                    GradientButton(
                        ontap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            if (selectedKategori!.isNotEmpty &&
                                gambar != null) {
                              _addPelanggaran();
                              MyNotificationService.sendNotificationToAllUsers(
                                  context,
                                  _judulController.text,
                                  _deskripsiController.text);
                              final snackBar = SnackBar(
                                content:
                                    const Text('Data berhasil ditambahkan!'),
                                action: SnackBarAction(
                                  label: 'Batal',
                                  textColor: kMain,
                                  onPressed: () {
                                    // Some action if needed
                                  },
                                ),
                              );

                              // Show the SnackBar
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                              Navigator.pop(context);
                            }
                          } else {}
                        },
                        title: 'Tambah')
                  ],
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
