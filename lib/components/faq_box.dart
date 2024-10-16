import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_dorm/components/shadow_container.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/screens/common/faq_content_page.dart';

class FaqBox extends StatelessWidget {
  final String title;
  final String content;
  final bool hasImage;

  const FaqBox({super.key, required this.title, required this.content, required this.hasImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ShadowContainer(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FaqContentPage(
                        title: title,
                        content: content,
                        hasImage: hasImage,
                      )));
        },
        child: Row(
          children: [
            Text(title,
                textAlign: TextAlign.start,
                style: kBoldTextStyle.copyWith(fontSize: 16)),
            const Spacer(),
            const Icon(FluentIcons.chevron_right_24_filled)
          ],
        ),
      ),
    );
  }
}
