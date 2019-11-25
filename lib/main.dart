/// 导入使用到的包
import 'package:flutter/material.dart';

/// 应用程序的主入口
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // 应用程序的跟 Widget
  @override
  Widget build(BuildContext context) {
    /// Material 是一个widget
    /// Material 是Flutter APP框架，通过它可以设置应用的名称、主题、语言、首页及路由列表等。
    return MaterialApp(
      title: 'Flutter Demo',
      ///ThemeData 主题,可以统一App页面主题
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      ///首页
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

///真正的首页 widget,继承了 StatefulWidget 类，StatefulWidget 是一个有状态的控件，我们可以改变它的状态
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
    ///调用了setState方法之后就会执行build进行刷新
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// setState 调用知乎就会执行 build
    /// Material库中提供的页面脚手架,包含一些顶部栏、body等
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      /// Center 是一个容器widget，只能方一个子widget 居中显示
      body: Center(
        /// Column 垂直方向的列表，可以包含多个子widget
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
      ///是页面右下角的带“+”的悬浮按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
