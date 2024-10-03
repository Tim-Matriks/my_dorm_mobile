import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_home.dart';
import 'package:my_dorm/components/home_calendar.dart';
import 'package:my_dorm/components/home_carousel.dart';
import 'package:my_dorm/constant/constant.dart';

class HomePageDormitizen extends StatelessWidget {
  const HomePageDormitizen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Stack(
        children: [
          SizedBox(
            height: 250,
            child: Stack(children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(gradient: kGradientMain),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('images/bg-asrama-wide.png',
                    width: double.infinity, fit: BoxFit.cover),
              ),
            ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarHome(
                  titleContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat pagi,',
                    style: kSemiBoldTextStyle.copyWith(
                        color: kWhite, fontSize: 15),
                  ),
                  Text(
                    'Rakha',
                    style: kBoldTextStyle.copyWith(color: kWhite, fontSize: 20),
                  ),
                ],
              )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Informasi',
                  style:
                      kSemiBoldTextStyle.copyWith(fontSize: 14, color: kWhite),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const HomeCarousel(),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: kRed,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(children: [
                  const Icon(
                    Icons.info_outline,
                    size: 18,
                    color: kWhite,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Kunci Anda Sekarang berada di ',
                    style:
                        kRegularTextStyle.copyWith(color: kWhite, fontSize: 12),
                  ),
                  Text(
                    'Helpdesk',
                    style: kBoldTextStyle.copyWith(color: kWhite, fontSize: 12),
                  )
                ]),
              ),
              const HomeCalendar(),
              const SizedBox(
                height: 150,
              )
            ],
          ),
        ],
      ),
    );
  }
}
