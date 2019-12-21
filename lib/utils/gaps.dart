import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 间隔
class Gaps {
  static const Widget empty = const SizedBox();

  static Widget line = const Divider();

  static Widget vLine = const SizedBox(
    width: 0.6,
    height: 24.0,
    child: const VerticalDivider(),
  );

  static Widget buildGap(double h){
    return SizedBox(height: h,);
  }
}
