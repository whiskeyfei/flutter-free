import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_free/res/colors.dart';
import 'package:flutter_free/utils/gaps.dart';
import 'package:flutter_free/widgets/app_bar.dart';
import 'package:flutter_free/widgets/click_item.dart';

class PrivacyPage extends StatefulWidget {
  @override
  _PrivacyPagePageState createState() => _PrivacyPagePageState();
}

class _PrivacyPagePageState extends State<PrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.dark_bg_color,
      appBar: const MyAppBar(
        backgroundColor: Colours.dark_bg_color,
        centerTitle: "隐私",
      ),
      body: Column(
        children: <Widget>[
          Gaps.buildGap(5.0),
          ClickItem(
            title: "隐私1",
          ),
          ClickItem(
            title: "隐私2",
          ),
          ClickItem(
            title: "隐私3",
          ),
          ClickItem(
            title: "隐私4",
          ),
          ClickItem(
            title: "隐私5",
          ),
          ClickItem(
            title: "修改密码",
          ),
        ],
      ),
    );
  }
}
