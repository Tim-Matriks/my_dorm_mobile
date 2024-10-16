import 'package:flutter/material.dart';
import 'package:my_dorm/components/appbar_page.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';

class FaqContentPage extends StatelessWidget {
  final String title;
  final String content;
  final bool hasImage;
  const FaqContentPage(
      {super.key,
      required this.title,
      required this.content,
      required this.hasImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: Column(
        children: [
          AppBarPage(
            title: 'FAQ',
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ShadowContainer(
              onTap: () {},
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.start,
                          style: kBoldTextStyle.copyWith(fontSize: 16),
                        ),
                        SizedBox(height: 8),
                        Text(
                          content,
                          textAlign: TextAlign.start,
                          style: kRegularTextStyle.copyWith(fontSize: 14),
                        ),
                        hasImage
                            ? Image.asset(
                                'images/faq-content.png',
                                width: 300,
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
