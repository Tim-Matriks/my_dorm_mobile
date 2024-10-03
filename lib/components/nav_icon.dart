// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';
import 'package:my_dorm/models/data_model.dart';
import 'package:provider/provider.dart';

class NavIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;
  const NavIcon({
    super.key,
    required this.icon,
    required this.title,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<DataModel>(context, listen: false).onNavBarTapped(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: (Provider.of<DataModel>(context, listen: false)
                        .selectedNavBar ==
                    index)
                ? kMain
                : Colors.black,
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: kSemiBoldTextStyle.copyWith(
              fontSize: 12,
              color: (Provider.of<DataModel>(context, listen: false)
                          .selectedNavBar ==
                      index)
                  ? kMain
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
