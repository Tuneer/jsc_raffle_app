import 'dart:math';

import 'package:flutter/material.dart';

class DeviceInfo {
  BuildContext? context;

  double? width, height, shortestSide, longestSide;

  DeviceInfo(BuildContext context) {
    this.context = context;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    shortestSide = MediaQuery.of(context).size.shortestSide;
    longestSide = MediaQuery.of(context).size.longestSide;

    if (shortestSide! >= 320 && shortestSide! < 800) {
      shortestSide = min(shortestSide!, 410);
    } else if (shortestSide! >= 800 && shortestSide! < 1024) {
      shortestSide = min(shortestSide!, 600);
    } else if (shortestSide! >= 1024) {
      shortestSide = 800;
    }
  }
}
