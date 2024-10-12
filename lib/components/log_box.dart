import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';

class LogBox extends StatelessWidget {
  final String nama;
  final String type;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const LogBox({
    super.key,
    required this.nama,
    required this.type,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ShadowContainer(
        onTap: () {},
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('images/dormitizen.png'),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nama,
                        textAlign: TextAlign.start,
                        style: kBoldTextStyle.copyWith(fontSize: 14)),
                    RichText(
                        text: TextSpan(
                            style: kMediumTextStyle.copyWith(
                                fontSize: 12, color: Colors.black),
                            children: [
                          const TextSpan(text: 'konfirmasi '),
                          TextSpan(
                              text: (type == 'In') ? 'masuk' : 'keluar',
                              style: kBoldTextStyle.copyWith(
                                  fontSize: 14, color: kRed)),
                          const TextSpan(text: ' asrama'),
                        ])),
                    const Row(
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          size: 10,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "27 November 2023 - 18:00",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    )
                  ]),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: onReject,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    gradient: kGradientMain,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Row(
                    children: [
                      Icon(Icons.edit, color: kWhite),
                      Text(
                        "Ubah",
                        style: TextStyle(
                            color: kWhite, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
