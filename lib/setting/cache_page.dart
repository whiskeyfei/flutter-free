import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_free/res/colors.dart';
import 'package:flutter_free/utils/gaps.dart';
import 'package:flutter_free/widgets/app_bar.dart';
import 'package:flutter_free/widgets/click_item.dart';

class CachePage extends StatefulWidget {
  @override
  _CachePagePageState createState() => _CachePagePageState();
}

class _CachePagePageState extends State<CachePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.dark_bg_color,
      appBar: const MyAppBar(
        backgroundColor: Colours.dark_bg_color,
        centerTitle: "清理缓存",
      ),
      body: Column(
        children: <Widget>[
          Gaps.buildGap(5.0),
          ClickItem(
            title: "缓存1",
          ),
          ClickItem(
            title: "缓存2",
          ),
          ClickItem(
            title: "缓存3",
          ),
          ClickItem(
            title: "缓存4",
          ),
          ClickItem(
            title: "缓存5",
          ),
          ClickItem(
            title: "缓存6",
            content: "23.6 MB",
          ),
        ],
      ),
    );
  }
}
