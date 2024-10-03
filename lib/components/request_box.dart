import 'package:flutter/material.dart';
import 'package:my_dorm/constant/constant.dart';

class RequestBox extends StatelessWidget {
  final String name;
  final String type;
  final void Function() accept;
  final void Function() reject;

  const RequestBox({
    super.key,
    required this.name,
    required this.type,
    required this.accept,
    required this.reject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: double.maxFinite,
        height: 65,
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black45,
                offset: Offset(1.00, 1.00),
                blurRadius: 4.00)
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 5),
            profile(),
            const SizedBox(width: 5),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(name,
                      textAlign: TextAlign.start,
                      style: kSemiBoldTextStyle.copyWith(
                          color: Colors.black, fontSize: 16)),
                  if (type == "In")
                    (Text("konfirmasi masuk asrama",
                        style: kMediumTextStyle.copyWith(
                            color: Colors.black, fontSize: 14)))
                  else
                    (Text("konfirmasi keluar asrama",
                        style: kMediumTextStyle.copyWith(
                            color: Colors.black, fontSize: 14)))
                ]),
            const SizedBox(width: 15),
            GestureDetector(onTap: reject, child: rejectW()),
            GestureDetector(onTap: accept, child: acceptW()),
          ],
        ));
  }

  Widget profile() {
    return Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
        ),
        child: Icon(
          Icons.person_2_rounded,
          size: 35,
          color: Colors.grey.shade700,
        ));
  }

  Widget rejectW() {
    return Container(
        height: 38,
        width: 38,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: kRed,
        ),
        child: const Icon(
          Icons.close_rounded,
          size: 35,
          color: kWhite,
        ));
  }

  Widget acceptW() {
    return const Icon(
      Icons.check_box_rounded,
      size: 50,
      color: Color(0xFF36C06E),
    );
  }
}
