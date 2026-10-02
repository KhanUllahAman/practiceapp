import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorResources {
  static const appMainColor = Color(0xff0074FC);
  static const whiteColor = Color(0xffFFFFFF);
  static const blackColor = Color(0xff000000);
  static const greyColor = Color(0xffF4F4F4);
  static const textfeildColor = Color(0xffE0E0E0);
  static const backgroundWhiteColor = Color(0xffF9FAFB);
  static const secondryColor = Color(0xff001E31);
  static const hintTextColor = Color(0xff1A1C1E);
  static const blueColor = Color(0xff1565FF);
  static const containerColor = Color(0xffF3F2F2);
  static const textBlueColor = Color(0xff000C19);
  static const floatingbuttonColor = Color(0xff001E31);
  static const lightBlueColor = Color(0xffE6F1FF);
  static const gradientRed = Color(0xFFBA0C2F);

  // Dark mode colors
  static const darkBg = Color(0xff121212);
  static const darkSurface = Color(0xff1E1E1E);
  static const darkCard = Color(0xff2A2A2A);
  static const darkText = Color(0xffEEEEEE);
  static const darkSubText = Color(0xffAAAAAA);
  static const darkBorder = Color(0xff3A3A3A);

  static Color bg(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkBg : whiteColor;

  static Color surface(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? darkSurface
      : backgroundWhiteColor;

  static Color card(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkCard : whiteColor;

  static Color text(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark ? darkText : blackColor;

  static Color subText(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? darkSubText
      : const Color(0xff555555);

  static Color border(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? darkBorder
      : const Color(0xffE0E0E0);

  static Color container(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? darkSurface
      : containerColor;

  static const present = Color(0xFF22c55e);
  static const wfh = Color(0xFF0074FC);
  static const leave = Color(0xFFa855f7);
  static const absent = Color(0xFFef4444);
  static const totalDays = Color(0xFF0074FC);
  static const weekend = Color(0xFF64748b);
  static const holiday = Color(0xFFf59e0b);
  static const wfhCard = Color(0xFF06b6d4);
  static const actualHours = Color(0xFF6366f1);
  static const expectedHours = Color(0xFF94a3b8);
  static const onTime = Color(0xFF22c55e);
  static const late = Color(0xFFf97316);
  static const manual = Color(0xFF8b5cf6);
  static const early = Color(0xFFec4899);
  static const overtime = Color(0xFF6366f1);
  static const halfDay = Color(0xFFeab308);

  static Color innerCard(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF1e293b)
      : const Color(0xFFF1F5F9);

  static Color divider(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF334155)
      : const Color(0xFFE2E8F0);

  static Color subtle(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF64748b)
      : const Color(0xFF94a3b8);

  static Color legend(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? const Color(0xFF94a3b8)
      : const Color(0xFF64748b);

  static SystemUiOverlayStyle getSystemUiOverlayStyle() {
    return SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: whiteColor,
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
    );
  }
}
