import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetsUtils{

  /// 读取assets 文件文本
  Future<String> loadStringByAssetsPath(String path, { bool cache = true }) async {
    final ByteData data = await rootBundle.load(path);
    if (data == null){
      throw FlutterError('Unable to load asset: $path');
    }
    return utf8.decode(data.buffer.asUint8List());
  }
}
