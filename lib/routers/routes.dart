import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_free/setting/set_router.dart';
import 'package:flutter_free/setting/setting_page.dart';

import 'router_provider.dart';

class Routes {

  /// 这边设置了首页，固定写法 /
  static String root = "/";
  static List<IRouterProvider> _listRouter = [];
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (context, parameters) {
        return Text("页面不存在");
      },
    );

    _listRouter.clear();
    _listRouter.add(SetRouter());
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
