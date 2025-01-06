import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_dorm/constant/constant.dart';

class PaketCard extends StatelessWidget {
  final String namaDormitizen;
  final String paketSampai;
  final String paketDiambil;
  final String status;
  final String pjPaket;

  const PaketCard({
    super.key,
    required this.namaDormitizen,
    required this.paketSampai,
    required this.paketDiambil,
    required this.status,
    required this.pjPaket,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.25),
          )
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset('images/paket.png', width: 80, height: 80),
              const SizedBox(height: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: status == 'sudah'
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  status == 'sudah' ? 'Diambil' : 'Belum',
                  style: TextStyle(
                    color: status == 'sudah' ? Colors.green : Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                namaDormitizen,
                style: kBoldTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.solidCircleUser,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    pjPaket,
                    style: kSemiBoldTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.timer,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    paketSampai,
                    style: kSemiBoldTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
              const SizedBox(height: 5),
               Row(
                children: [
                  const Icon(
                    Icons.timer,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    paketDiambil,
                    style: kSemiBoldTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
              const SizedBox(height: 5),
            ],
          )
        ],
      ),
    );
  }
}
