import 'package:flutter/material.dart';

import '../colors/app_color.dart';
import 'text_styles.dart';

class InputStyle {
  static InputDecoration inputDecorationTextField(
      {String? hint,
      Widget prefixIcon = const SizedBox(),
      Widget suffixIcon = const SizedBox()}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColor.solitude,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      //hintText: hint,
      labelText: hint,
      counterText: '',
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelStyle: Styles.regularGullGrey12,
      hintStyle: Styles.regularGullGrey12,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      //helperText: 'Helper text',
    );
  }

  static InputDecoration inputDecorationDropdown(
      {String? hint, Widget prefixIcon = const SizedBox()}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColor.solitude,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
      hintText: hint,
      hintStyle: Styles.regularGullGrey12,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      prefixIcon: prefixIcon,
    );
  }
}
