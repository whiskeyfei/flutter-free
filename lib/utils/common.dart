import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constant {
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool isRelease  = const bool.fromEnvironment("dart.vm.product");


  /// rootBundle.loadString源码修改
  Future<String> loadString(String key, { bool cache = true }) async {
    final ByteData data = await rootBundle.load(key);
    if (data == null)
      throw FlutterError('Unable to load asset: $key');
    return utf8.decode(data.buffer.asUint8List());
  }
}
