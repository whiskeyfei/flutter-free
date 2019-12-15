> 上一篇我们在 Mac 上搭建了 Flutter 的开发环境，今天我们来学习使用 Android Studio 创建 Flutter 默认工程，并且了解 Flutter 工程项目结构，分析 Flutter 项目是如何运行起来的。

首先看下运行效果,当我点击右下角的“＋”按钮时，中间的数字会累计更新

![](https://upload-images.jianshu.io/upload_images/877678-0dee96d24b69b7e4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)

### 工程结构

![flutter 项目结构](https://upload-images.jianshu.io/upload_images/877678-1970c3d4e2f99b5e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)

介绍几个重要的目录

目录 | 功能
------- | -------
android|本质就是一个Android 项目
build|iOS和Android的构建产物
ios|本质是一个iOS项目
lib|Flutter 工程文件目录
test|测试相关文件
pubspec.lock|依赖信息
pubspec.yaml|Flutter 的资源配置文件和三方库引用管理

### 工程配置 pubspec.yaml

先来看看 Flutter 工程配置文件，我们知道在 Android 项目种我们可以通过 Maven 方式来管理三方引用，通过values中的文件命名来配置各种资源，而在 Flutter 种 是通过 pubspec.yaml 来管理资源配置文件。

YAML是一种直观、可读性高并且容易被人类阅读的文件格式，它和xml或Json相比，它语法简单并非常容易解析，所以YAML常用于配置文件，Flutter也是用yaml文件作为其配置文件。

我们把 pubspec.yaml 文件内容全部贴出来，具体的字段含义我已经写在代码里，看一下就好

```
#应用或包名称
name: flutter_free

# 应用或包的描述、简介
description: A new Flutter application.

# 应用或包的版本号
version: 1.0.0+1

# 当前环境
environment:
  sdk: ">=2.1.0 <3.0.0"

# 应用或包依赖的其它包或插件
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^0.1.2

  # 新添加的依赖
  english_words: ^3.1.3

#开发环境依赖的工具包
dev_dependencies:
  flutter_test:
    sdk: flutter

# The following section is specific to Flutter.

#flutter相关的配置选项
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true
```

###### Pub仓库

Pub([https://pub.dartlang.org](https://pub.dartlang.org/) )是Google官方的Dart Packages仓库，类似于node中的npm仓库，android中的jcenter。我们可以在Pub上面查找我们需要的包和插件，也可以向Pub发布我们的包和插件。

例如：我们来引入 english_words  三方库，点击右上角 Packages get 即可，类似与 gradle 文件更新了使用点击同步按钮是类似的。

![](https://upload-images.jianshu.io/upload_images/877678-82402a68f4184279.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/840)

### 首页代码分析

代码比较简单，针对代码中出现的一些关键字、类名等就直接写注释了，看起来比较直观，例如：

```
// 导入使用到的包
import 'package:flutter/material.dart';

// 应用程序的主入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 应用程序的跟 Widget
  @override
  Widget build(BuildContext context) {
    // Material 是一个widget
    // Material 是Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。
    return MaterialApp(
      title: 'Flutter Demo',
      //ThemeData 主题,可以统一App页面主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //首页
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

//真正的首页 widget,继承了 StatefulWidget 类，StatefulWidget 是一个有状态的控件，我们可以改变它的状态
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  //点击事件
  void _incrementCounter() {
    //调用了setState方法之后就会执行build进行刷新
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState 调用知乎就会执行 build
    // Material库中提供的页面脚手架,包含一些顶部栏、body等
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Center 是一个容器widget，只能方一个子widget
      body: Center(
        // Column 垂直方向的列表，可以包含多个子widget
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      //是页面右下角的带“+”的悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

```

### 热重载

由于 Dart 语言支持 JIT和AOT，所以开发阶段我们可以使用热重载这个功能，做到保存代码后能够及时查看运行结果，无需重新 build 运行，比起Android 或者 iOS build 一次要好几分钟来说，Flutter 的 hot reload 非常人性化。

### StatelessWidget 和 StatefulWidget

我们暂时先了解两者的基本含义，更深入的理解我们在后面文章种讲解使用。

* StatelessWidget 是不需要状态更改的 widget,它没有要管理的内部状态
* StatefulWidget 是可变状态的 widget, 使用`setState`方法管理StatefulWidget 状态的改变。调用`setState`更改状态，然后来更新应用界面
更多内容可关注公众号查看

先留一个疑问：为啥要设计 StatefulWidget 与 StatelessWidget ？两者有什么本质区别？

### 代码实例
已传置 github [flutter-free](https://github.com/whiskeyfei/flutter-free)