import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free/res/colors.dart';
import 'package:flutter_free/routers/application.dart';
import 'package:flutter_free/setting/about_page.dart';
import 'package:flutter_free/setting/privacy_page.dart';
import 'package:flutter_free/setting/set_router.dart';
import 'package:flutter_free/utils/gaps.dart';
import 'package:flutter_free/utils/launch_utils.dart';
import 'package:flutter_free/webview/webview_page.dart';
import 'package:flutter_free/widgets/app_bar.dart';
import 'package:flutter_free/widgets/click_item.dart';
import 'package:flutter_free/widgets/exit_dialog.dart';

import 'cache_page.dart';
import 'device_page.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.dark_bg_color,
      appBar: const MyAppBar(
        backgroundColor: Colours.dark_bg_color,
        centerTitle: "设置",
      ),
      body: Column(
        children: <Widget>[
          Gaps.buildGap(5.0),
          ClickItem(
            title: "账号管理",
          ),
          ClickItem(
            title: "清除缓存",
            content: "23.5MB",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CachePage()))
          ),
          ClickItem(
            title: "设备信息",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => DevicePage()))
          ),
          ClickItem(
            title: "隐私",
            // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PrivacyPage()))
            onTap: (){
              Application.router.navigateTo(context, SetRouter.privacyPage,transition: TransitionType.none);
              // Application.router.navigateTo(context, "/setting/privacyPage?isAdd=false");
              // Application.router.navigateTo(context, "/setting/privacyPage?isAdd=false").then((result) {
              //   print("result:$result");
              // });
            },
          ),
          ClickItem(
            title: "检查更新",
          ),
          ClickItem(
            title: "关于我们",
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AboutPage()))
          ),
          ClickItem(
              title: "退出当前账号",
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => ExitDialog()
                );
              }
          ),
          ClickItem(
              title: "调用电话",
              onTap: () {
                // LaunchUtils.launchTelURL("188181818");
                LaunchUtils.launchEmailURL('aaaaa@qq.com',queryParameters: {
                  'subject': 'Example Subject & Symbols are allowed!'
                });
              }
          ),
          ClickItem(
              title: "webview",
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WebViewPage(url: "https://flutterchina.club/",)))
          ),

        ],
      ),
    );
  }

}
