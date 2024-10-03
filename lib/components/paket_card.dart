import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_dorm/constant/constant.dart';

class PaketCard extends StatelessWidget {
  final String namaBarang;
  final bool edit;
  final String namaDormitizen;
  final DateTime time;
  const PaketCard(
      {super.key,
      required this.edit,
      required this.namaBarang,
      required this.namaDormitizen,
      required this.time});

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
                color: Colors.black.withOpacity(0.25))
          ]),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset('images/paket.png'),
              (edit == true)
                  ? Row(
                      children: [
                        Text(
                          'Selesai',
                          style: kSemiBoldTextStyle.copyWith(fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(Icons.check)
                      ],
                    )
                  : const SizedBox(
                      height: 0,
                    )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Barang',
                style: kBoldTextStyle.copyWith(fontSize: 15),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.place,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    (false) ? 'Helpdesk' : 'Dormitizen',
                    style: kSemiBoldTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
              SizedBox(
                height: (edit == true) ? 5 : 0,
              ),
              (edit == true)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          FontAwesomeIcons.solidCircleUser,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          namaDormitizen,
                          style: kSemiBoldTextStyle.copyWith(fontSize: 14),
                        )
                      ],
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.timer,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    time.toString(),
                    style: kSemiBoldTextStyle.copyWith(fontSize: 14),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
