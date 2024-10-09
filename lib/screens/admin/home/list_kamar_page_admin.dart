import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/constant/constant.dart';

class ListKamarPageAdmin extends StatelessWidget {
  const ListKamarPageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarPage(
          title: 'Kamar',
          canBack: false,
        ),
        SizedBox(height: 20),
        Text(
          'Lantai 1',
          style: kBoldTextStyle.copyWith(fontSize: 24),
          textAlign: TextAlign.left, //FIXME: Gamau align left
        ),
        SizedBox(height: 10),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '101',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '102',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kGrey, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '103',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '104',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '105',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '106',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '107',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kGrey, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '108',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '109',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '110',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kGrey, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '111',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '112',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '113',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kGrey, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '114',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '115',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '116',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kGrey, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '117',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '118',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '119',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '120',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '121',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kGrey, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '122',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '123',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: kRed, borderRadius: BorderRadius.circular(5)),
                  child: Center(
                      child: Text(
                    '124',
                    textAlign: TextAlign.center,
                    style: kBoldTextStyle.copyWith(fontSize: 24, color: kWhite),
                  )),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
