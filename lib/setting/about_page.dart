import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free/res/colors.dart';
import 'package:flutter_free/utils/gaps.dart';
import 'package:flutter_free/webview/webview_page.dart';
import 'package:flutter_free/widgets/app_bar.dart';
import 'package:flutter_free/widgets/click_item.dart';
import 'package:url_launcher/link.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.dark_bg_color,
      appBar: const MyAppBar(
        backgroundColor: Colours.dark_bg_color,
        centerTitle: "关于我们",
      ),
      body: Column(
        children: <Widget>[
          Gaps.buildGap(50.0),
          FlutterLogo(
            size: 80.0,
          ),
          Gaps.buildGap(20.0),
          Container(
            child: Text("version:1.0.0",style: TextStyle(color: Colors.white,),),
          ),
          Gaps.buildGap(10.0),
          ClickItem(
            title: "评价",
          ),
          ClickItem(
            title: "用户协议",
          ),
          ClickItem(
            title: "版本检测",
          ),
          Expanded(
            child:  Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 20),
              // child: Text("Copyright @2019 XXX",style: TextStyle(color: Colors.white,),),
              child:  Text.rich(TextSpan(children: [
                TextSpan(
                    text: "aa",
                    style: TextStyle(color: Colors.blue)),
                TextSpan(
                    text: "https://flutterchina.club",
                    style: TextStyle(color: Colors.blue),
                  recognizer: new TapGestureRecognizer()..onTap = () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WebViewPage(url: "https://flutterchina.club/",)));
                  },
                ),
              ])),
            ),
          ),
        ],
      ),
    );
  }
}
