import 'package:flutter/material.dart';

const kGradientMain =
    LinearGradient(begin: Alignment(-1, -0.2), end: Alignment(1, 0.2), colors: [
  Color(0xFFCC3545),
  Color(0xFF994F56),
  Color(0xFF686767),
]);

const kGradientGreen = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFA1F2B8),
      Color(0xFF36C06E),
      Color(0xFF1D3F83),
    ]);
const kGradientBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFA1D5F2),
      Color(0xFF366EC0),
      Color(0xFF6E1D83),
    ]);
const kGradientOrange = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFEFAB02),
      Color(0xFFF5911F),
      Color(0xFFFF5E0C),
    ]);
const kGradientRed = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF9597),
      Color(0xFFEA494C),
      Color(0xFF831D5A),
    ]);

const kRegularTextStyle = TextStyle(fontWeight: FontWeight.w400);
const kMediumTextStyle = TextStyle(fontWeight: FontWeight.w500);
const kSemiBoldTextStyle = TextStyle(fontWeight: FontWeight.w600);
const kBoldTextStyle = TextStyle(fontWeight: FontWeight.w700);

const kWhite = Color(0xFFFEFEFF);
const kBgColor = Color(0xFFF8F8F8);
const kGray = Color(0xFFD9D9D9);
const kGrey = Color(0xFFAEA7A7);
const kFormBG = Color(0xFFF0F0F0);
const kFormText = Color(0xFFABABAB);
const kRed = Color(0xFF994F56);
const kMain = Color(0xFFCC3545);
const kBlueGrey = Color(0xFF696F8E);
const kReddish = Color(0xFFEDD8D8);

BoxShadow basicDropShadow = BoxShadow(
    color: Colors.black.withOpacity(0.25),
    offset: const Offset(0, 4),
    blurRadius: 4);

InputDecoration basicInputDecoration(String title) {
  return InputDecoration(
    labelText: title,
    filled: true,
    fillColor: kFormBG,
    alignLabelWithHint: true,
    labelStyle: kRegularTextStyle.copyWith(color: kFormText),
    floatingLabelStyle: kRegularTextStyle.copyWith(color: kMain),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: kMain, width: 2),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 2),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color(0xFFE2E2E2), width: 2),
    ),
  );
}
