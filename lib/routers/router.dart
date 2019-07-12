import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jdshop/pages/shoplistpage.dart';
import 'package:flutter_jdshop/pages/tabs/tabs.dart';

//配置路由
final routers = {
  "/": (context) => Tabs(),
  "/shopList": (context, {Map arguments}) => ShopListPage(arguments: arguments),
}; //固定写法

var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routers[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = CupertinoPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
