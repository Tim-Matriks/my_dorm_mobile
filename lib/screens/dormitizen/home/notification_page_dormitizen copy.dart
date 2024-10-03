import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';

class NotificationPageDormitizen extends StatelessWidget {
  const NotificationPageDormitizen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const AppBarPage(
        title: 'Notifikasi',
        canBack: false,
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
                          Row(
                            children: [
                              Text(
                                'Jam Malam',
                                style:
                                    kBoldTextStyle.copyWith(fontSize: 14),
                              ),
                              const Spacer(),
                              Text(
                                '21.00',
                                style: kMediumTextStyle.copyWith(
                                    fontSize: 14, color: kGrey),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Dear Rakha, Asrama akan tutup dalam 1 jam lagi nih! pastikan kamu ada di asrama yaa',
                            style: kMediumTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )),
                );
              }))
    ]);
  }
}
