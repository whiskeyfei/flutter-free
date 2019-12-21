import 'package:flutter/material.dart';
import 'package:flutter_free/res/colors.dart';
import 'package:flutter_free/setting/about_page.dart';
import 'package:flutter_free/setting/privacy_page.dart';
import 'package:flutter_free/utils/gaps.dart';
import 'package:flutter_free/widgets/app_bar.dart';
import 'package:flutter_free/widgets/click_item.dart';
import 'package:flutter_free/widgets/exit_dialog.dart';

import 'cache_page.dart';

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
            title: "夜间模式",
          ),
          ClickItem(
            title: "隐私",
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PrivacyPage()))
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
        ],
      ),
    );
  }

}
