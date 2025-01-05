import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/form_date_time_picker.dart';
import 'package:my_dorm/components/form_dormitizen_picker.dart';
import 'package:my_dorm/components/form_photo_picker.dart';
import 'package:my_dorm/components/form_textfield.dart';
import 'package:my_dorm/components/gradient_button.dart';
import 'package:my_dorm/constant/constant.dart';

class AddPaketPage extends StatefulWidget {
  const AddPaketPage({super.key});

  @override
  State<AddPaketPage> createState() => _AddPaketPageState();
}

class _AddPaketPageState extends State<AddPaketPage> {
  final TextEditingController _namaBarangController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          const AppBarPage(title: 'Tambah Paket'),
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
                    const FormDormitizenPicker(),
                    FormPhotoPicker(title: 'paket',onImageSelected: (selectedImage) {
            // Handle the selected image here
            if (selectedImage != null) {
              print('Selected image path: ${selectedImage.path}');
            } else {
              print('Image cleared');
            }
          },),
                    FormTextField(
                        label: 'Nama barang',
                        controller: _namaBarangController),
                    FormDatePicker(
                      onDateTimeSelected: (selectedDateTime) {
            // Handle the combined DateTime here
            print('Selected DateTime: $selectedDateTime');
          },
                    ),
                    GradientButton(
                        ontap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            final snackBar = SnackBar(
                              content: const Text('Data berhasil ditambahkan!'),
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
                        },
                        title: 'Kirim')
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
