import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/form_date_time_picker.dart';
import 'package:my_dorm/components/form_dormitizen_picker.dart';
import 'package:my_dorm/components/form_drop_down.dart';
import 'package:my_dorm/components/gradient_button.dart';
import 'package:my_dorm/constant/constant.dart';

class AddLogPage extends StatefulWidget {
  const AddLogPage({super.key});

  @override
  State<AddLogPage> createState() => _AddLogPageState();
}

class _AddLogPageState extends State<AddLogPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          const AppBarPage(title: 'Tambah Log Manual'),
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
                    FormDropDown(
                      kategoriItems: const ['Masuk', 'Keluar'],
                      title: 'Status',
                      onItemSelected: (selectedItem) {
                        // Handle the selected item here
                        print('Selected item: $selectedItem');
                      },
                    ),
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
