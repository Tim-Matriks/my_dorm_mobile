// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_dorm/components/nav_icon.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/models/data_model.dart';
import 'package:my_dorm/models/navbar_model.dart';
import 'package:provider/provider.dart';

class MainNavBarHome extends StatelessWidget {
  final List<Widget> widgetOptions;
  final List<NavBarModel> navIcons;
  const MainNavBarHome({
    super.key,
    required this.widgetOptions,
    required this.navIcons,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      return Scaffold(
        backgroundColor: kBgColor,
        body: Stack(
          children: [
            widgetOptions[data.selectedNavBar],
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [basicDropShadow],
                      borderRadius: BorderRadius.circular(10)),
                  child: const SafeArea(
                      top: false,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                      )),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      for (int i = 0; i < navIcons.length ~/ 2; i++)
                        Expanded(
                          child: NavIcon(
                            icon: navIcons[i].icon,
                            title: navIcons[i].title,
                            index: i,
                          ),
                        ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: kGradientMain),
                                child: const Icon(
                                  /*(_masuk)
                                  ? FontAwesomeIcons.doorClosed
                                  : */
                                  FontAwesomeIcons.doorOpen,
                                  color: kWhite,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                /*(_masuk) ? 'Masuk' : */ 'Keluar',
                                style: kSemiBoldTextStyle.copyWith(
                                    fontSize: 14, color: kRed),
                              ),
                            ],
                          ),
                        ),
                      ),
                      for (int i = navIcons.length ~/ 2;
                          i < navIcons.length;
                          i++)
                        Expanded(
                          child: NavIcon(
                            icon: navIcons[i].icon,
                            title: navIcons[i].title,
                            index: i,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
