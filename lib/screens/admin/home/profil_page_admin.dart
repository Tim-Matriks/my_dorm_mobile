import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_home.dart';
import 'package:my_dorm/components/profile_desc.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/screens/auth/login_page.dart';

class ProfilPageAdmin extends StatelessWidget {
  const ProfilPageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Stack(children: [
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
            children: [
              AppBarHome(
                  titleContent: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profil',
                    style: kBoldTextStyle.copyWith(color: kWhite, fontSize: 20),
                  ),
                ],
              )),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.06,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(color: kWhite, width: 2),
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                        image: AssetImage('images/dormitizen.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'Rakha Galih Nugraha Sukma',
                    textAlign: TextAlign.center,
                    style: kSemiBoldTextStyle.copyWith(fontSize: 20),
                  )),
              Container(
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    gradient: kGradientMain,
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    ProfileDesc(title: 'NIM', value: '1302223118'),
                    ProfileDesc(title: 'Status', value: 'Mahasiswa'),
                    ProfileDesc(title: 'Gedung', value: 'Sebetul (Gedung 8)'),
                    ProfileDesc(title: 'No kamar', value: '405'),
                  ],
                ),
              ),
              ShadowContainer(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                child: Row(
                  children: [
                    const Icon(
                      FluentIcons.sign_out_24_filled,
                      color: kMain,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Keluar',
                      style: kSemiBoldTextStyle.copyWith(
                          fontSize: 14, color: kMain),
                    )
                  ],
                ),
              )
            ],
          )
        ]));
  }
}
