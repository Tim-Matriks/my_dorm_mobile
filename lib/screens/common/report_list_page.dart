import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/screens/common/add_report_page.dart';

class ReportListPage extends StatelessWidget {
  const ReportListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          AppBarPage(
            title: 'Laporan',
            onAdd: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddReportPage()));
            },
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ShadowContainer(
                          onTap: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kendala riwayat paket',
                                style: kBoldTextStyle.copyWith(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '10 Januari 2024',
                                style: kMediumTextStyle.copyWith(
                                    fontSize: 14, color: kGrey),
                              ),
                              Text(
                                'status: dalam proses',
                                style: kMediumTextStyle.copyWith(
                                    fontSize: 14, color: kGrey),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Paket yang sudah tiba tidak muncul di notifikasi saya',
                                style: kMediumTextStyle.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          )),
                    );
                  }))
        ],
      ),
    );
  }
}
