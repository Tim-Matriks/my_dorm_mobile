import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/screens/admin/apps/form/add_informasi_page.dart';

class ListInformasiPage extends StatelessWidget {
  const ListInformasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      AppBarPage(
        title: 'Informasi',
        onAdd: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddInformasiPage()));
        },
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
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
      Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        height: 200,
        decoration: BoxDecoration(
            gradient: kGradientBlue, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pengurasan Air',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '11 November 2023',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Hapus informasi'),
                          content: Text(
                              'Apakah anda yakin ingin menghapus informasi ini?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Tidak'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // kalau tidak jadi hapus
                              },
                            ),
                            TextButton(
                              child: const Text('Ya'),
                              onPressed: () {
                                Navigator.of(context).pop(); // kalau jadi hapus
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        height: 200,
        decoration: BoxDecoration(
            gradient: kGradientGreen, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcoming Party',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '11 November 2023',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Hapus informasi'),
                          content: Text(
                              'Apakah anda yakin ingin menghapus informasi ini?'),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Tidak'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); // kalau tidak jadi hapus
                              },
                            ),
                            TextButton(
                              child: const Text('Ya'),
                              onPressed: () {
                                Navigator.of(context).pop(); // kalau jadi hapus
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            )
          ],
        ),
      )
    ]));
  }
}
