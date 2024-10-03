import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_dorm/components/apps_icon.dart';
import 'package:my_dorm/components/request_box.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/models/request_model.dart';
import 'package:my_dorm/screens/admin/apps/list/list_informasi_page.dart';
import 'package:my_dorm/screens/admin/apps/list/list_keterlambatan_page.dart';
import 'package:my_dorm/screens/admin/apps/list/list_paket_page.dart';
import 'package:my_dorm/screens/admin/apps/list/list_riwayat_request_page.dart';
import 'package:my_dorm/screens/admin/apps/list/list_statistik_page.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  List<RequestModel> requests = [
    RequestModel(
      name: "Rakha Galih Nugarha",
      type: "In",
    ),
    RequestModel(
      name: "Iksan Oktav Risandy",
      type: "In",
    ),
    RequestModel(name: "Dias Adani", type: "Out"),
    RequestModel(name: "Abdillah Aufa", type: "In")
  ];
  @override
  Widget build(BuildContext context) {
    void popList(List L, int index) {
      setState(() {
        L.removeAt(index);
      });
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
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
                          width: width, fit: BoxFit.cover),
                    ),
                    SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Selamat pagi,',
                                          style: kSemiBoldTextStyle.copyWith(
                                              fontSize: 15, color: kWhite),
                                        ),
                                        Text(
                                          'Bpk Soleh',
                                          style: kBoldTextStyle.copyWith(
                                              fontSize: 20, color: kWhite),
                                        )
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const Apps()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          color: kMain,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          const SizedBox(
                                            width: 21,
                                          ),
                                          Text(
                                            'Helpdesk',
                                            style: kSemiBoldTextStyle.copyWith(
                                                fontSize: 15, color: kWhite),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          const CircleAvatar(
                                            radius: 15,
                                            backgroundColor: kGray,
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Dormitzen di Asrama',
                                          style: kSemiBoldTextStyle.copyWith(
                                              fontSize: 14, color: kWhite),
                                        ),
                                        Text(
                                          '110',
                                          style: kBoldTextStyle.copyWith(
                                              fontSize: 45, color: kWhite),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Dormitzen di Luar',
                                          style: kSemiBoldTextStyle.copyWith(
                                              fontSize: 14, color: kWhite),
                                        ),
                                        Text(
                                          '50',
                                          style: kBoldTextStyle.copyWith(
                                              fontSize: 45, color: kWhite),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Request Dormitizen',
                        style: kBoldTextStyle.copyWith(fontSize: 14),
                      ),
                      SizedBox(
                        height: 220,
                        child: (requests.isEmpty)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                      child: Image.asset('images/women.png')),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      'Tidak ada request',
                                      style: kBoldTextStyle.copyWith(
                                          fontSize: 14, color: kGrey),
                                    ),
                                  ),
                                ],
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: Column(
                                      children: List.generate(
                                          requests.length,
                                          (index) => RequestBox(
                                                name: requests[index].name,
                                                type: requests[index].type,
                                                accept: () {
                                                  popList(requests, index);
                                                },
                                                reject: () {
                                                  popList(requests, index);
                                                },
                                              ))),
                                ),
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Apps',
                            style: kBoldTextStyle.copyWith(fontSize: 14),
                          ),
                          Text(
                            'Lainnya',
                            style: kMediumTextStyle.copyWith(
                                fontSize: 14, color: kMain),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          AppsIcon(
                            icon: FontAwesomeIcons.history,
                            title: 'Riwayat\nRequest',
                            pushWidget: ListRiwayatRequestPage(),
                          ),
                          AppsIcon(
                            icon: FontAwesomeIcons.box,
                            title: 'Paket',
                            pushWidget: ListPaketPage(),
                          ),
                          AppsIcon(
                            icon: FontAwesomeIcons.bullhorn,
                            title: 'Informasi',
                            pushWidget: ListInformasiPage(),
                          ),
                          AppsIcon(
                            icon: FontAwesomeIcons.chartSimple,
                            title: 'Statistik',
                            pushWidget: ListStatistikPage(),
                          ),
                          AppsIcon(
                            icon: FluentIcons.chat_warning_24_filled,
                            title: 'Keterlambatan',
                            pushWidget: ListKeterlambatanPage(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
