import 'package:fluro/fluro.dart';
import 'package:flutter_free/routers/router_provider.dart';

import 'privacy_page.dart';
import 'setting_page.dart';

class SetRouter implements IRouterProvider{

  static String setting = "/setting";
  static String privacyPage = "/setting/privacyPage";///隐私

  @override
  void initRouter(FluroRouter router) {
    router.define(setting, handler: Handler(handlerFunc:(context, parameters) => SettingPage()));
    router.define(privacyPage, handler: Handler(
      handlerFunc: (context, parameters) {
        bool isAdd = parameters['isAdd']?.first == "true";
        print("isAdd:$isAdd");
        return PrivacyPage();
      },
    ));

  }

}