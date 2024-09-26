import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/device_info.dart';
import '../colors/app_color.dart';

var secondaryTextColor = AppColor.secondaryTextColor;
var gullGrey = AppColor.gullGreyColor;
var hyperlink = AppColor.hyperlinkColor;

class Styles {
  static var boldSecondary12 = GoogleFonts.alike(
      textStyle: TextStyle(
          color: secondaryTextColor,
          fontSize: 12,
          fontWeight: FontWeight.bold));

  static var regularGullGrey12 =
      GoogleFonts.alike(textStyle: TextStyle(color: gullGrey, fontSize: 14));

  static TextStyle commonTextStyle(
          {required BuildContext context,
          required double size,
          required Color color,
          FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.alike(
        textStyle: TextStyle(
          color: color,
          fontSize: DeviceInfo(context).shortestSide! / 100 * size,
          fontWeight: fontWeight,
        ),
      );

  // responsive
  static regularSecondary(BuildContext context, double size) =>
      GoogleFonts.alike(
          textStyle: TextStyle(
              color: secondaryTextColor,
              fontSize: DeviceInfo(context).shortestSide! / 100 * size));

  static regularSecondaryBold(BuildContext context, double size) =>
      GoogleFonts.alike(
          textStyle: TextStyle(
              color: secondaryTextColor,
              fontSize: DeviceInfo(context).shortestSide! / 100 * size,
              fontWeight: FontWeight.bold));

  static italicGrey(BuildContext context, double size) => GoogleFonts.alike(
      textStyle: TextStyle(
          color: gullGrey,
          fontStyle: FontStyle.italic,
          fontSize: DeviceInfo(context).shortestSide! / 100 * size));

  static hyperLink(BuildContext context, double size) => GoogleFonts.alike(
      textStyle: TextStyle(
          color: hyperlink,
          decoration: TextDecoration.underline,
          fontSize: DeviceInfo(context).shortestSide! / 100 * size));
}
