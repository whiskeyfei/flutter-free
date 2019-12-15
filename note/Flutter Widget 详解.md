> Flutter 一切皆 Widget

![Widget 树](https://upload-images.jianshu.io/upload_images/877678-46327067a42b8fae.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/640)

### Android View

我们知道在Android中，View 是屏幕上显示的所有内容的基础， 按钮、工具栏、输入框等一切都是View，同时也有ViewGroup 来容纳各种子 View 控件。

### Flutter Widget

类比到 Flutter 中，Widget 相当于 Android 中的 View 概念，但是要比View 概括面更广，拿 Android 和 iOS 平台来举例，例如：Activity、ViewGroup、View、View Controller 、Theme、Application等，这些都是不同的类型，而在 Flutter 中这些都可以理解成 Widget，正是“Flutter 一些皆 Widget”。

不同点：

* Android View 可以直接修改其属性
* Flutter widget 每次更新需要重建widget

### Widget VS Element

* Widget：描述一个UI元素的配置数据，并不是最终绘制在设备屏幕上的显示元素，它只是描述显示元素的一个配置数据
* Element：真实屏幕上显示元素，Widget只是描述Element的配置数据

一个Widget 可以对应多个Element 日常多操作的是Widget部分,当然可以自定义Widget 或者 Element

常见的Widget子类为StatelessWidget(无状态)和StatefulWidget(有状态)；

* StatelessWidget：内部没有保存状态，UI界面创建后不会发生改变
* StatefulWidget：内部有保存状态，当状态发生改变，会触发更新

### Widget 类

![](https://upload-images.jianshu.io/upload_images/877678-12084686005eb36d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)


```
@immutable
abstract class Widget extends DiagnosticableTree {
  /// Initializes [key] for subclasses.
  const Widget({ this.key });

  /// Controls how one widget replaces another widget in the tree.
  ///
  /// If the [runtimeType] and [key] properties of the two widgets are
  /// [operator==], respectively, then the new widget replaces the old widget by
  /// updating the underlying element (i.e., by calling [Element.update] with the
  /// new widget). Otherwise, the old element is removed from the tree, the new
  /// widget is inflated into an element, and the new element is inserted into the
  /// tree.
  ///
  /// In addition, using a [GlobalKey] as the widget's [key] allows the element
  /// to be moved around the tree (changing parent) without losing state. When a
  /// new widget is found (its key and type do not match a previous widget in
  /// the same location), but there was a widget with that same global key
  /// elsewhere in the tree in the previous frame, then that widget's element is
  /// moved to the new location.
  ///
  /// Generally, a widget that is the only child of another widget does not need
  /// an explicit key.
  ///
  /// See also the discussions at [Key] and [GlobalKey].
  final Key key;

  /// Inflates this configuration to a concrete instance.
  ///
  /// A given widget can be included in the tree zero or more times. In particular
  /// a given widget can be placed in the tree multiple times. Each time a widget
  /// is placed in the tree, it is inflated into an [Element], which means a
  /// widget that is incorporated into the tree multiple times will be inflated
  /// multiple times.
  /// 核心接口
  @protected
  Element createElement();

  /// A short, textual description of this widget.
  @override
  String toStringShort() {
    return key == null ? '$runtimeType' : '$runtimeType-$key';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.dense;
  }


  /// Whether the `newWidget` can be used to update an [Element] that currently
  /// has the `oldWidget` as its configuration.
  ///
  /// An element that uses a given widget as its configuration can be updated to
  /// use another widget as its configuration if, and only if, the two widgets
  /// have [runtimeType] and [key] properties that are [operator==].
  ///
  /// If the widgets have no key (their key is null), then they are considered a
  /// match if they have the same type, even if their children are completely
  /// different.
 /// 通过 oldWidget和newWidget 属性对比来决定是否重用 Element
  static bool canUpdate(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType
        && oldWidget.key == newWidget.key;
  }
}


```




Widget 类本身是一个抽象类，其中最核心的就是定义了createElement()接口，Widget 内部并没有什么复杂的处理，而在Flutter中，一般都不会直接继承 Widget 类来实现一个新 Widget。

Flutter 提供了两个实现类 StatelessWidget 或 StatefulWidget 。

### StatelessWidget

```
abstract class StatelessWidget extends Widget {

  const StatelessWidget({ Key key }) : super(key: key);

  @override
  StatelessElement createElement() => StatelessElement(this);

  @protected
  Widget build(BuildContext context);
}

/// An [Element] that uses a [StatelessWidget] as its configuration.
class StatelessElement extends ComponentElement {
  /// Creates an element that uses the given widget as its configuration.
  StatelessElement(StatelessWidget widget) : super(widget);

  @override
  StatelessWidget get widget => super.widget;

  @override
  Widget build() => widget.build(this);

  @override
  void update(StatelessWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    _dirty = true;
    rebuild();
  }
}

```

看上面代码 知道 StatelessElement 继承 ComponentElement，ComponentElement 又继承Element类，看注释知道 StatelessElement 与 StatelessWidget 相对应，并且 StatelessWidget 作为 StatelessElement 的配置数据。

其实知道这个过程就可以了，把概念和代码对应起来就容易理解了。

### StatefulWidget

与 StatelessWidget 相对应的，有一些 Widget,比如: ListView 需要跟进网络请求的结果进行UI刷新，所以 StatefulWidget 不仅要 build UI，还有根据数据变化来更新UI，也就是重新绘制 Widget。

简单看下 StatefulWidget 代码


```dart
abstract class StatefulWidget extends Widget {
  const StatefulWidget({ Key key }) : super(key: key);

  @override
  StatefulElement createElement() => new StatefulElement(this);

  @protected
  State createState();
}
```

和 StatelessWidget 对比来看，创建了一个 StatefulElement，并且多了一个 createState 方法，少了一个 build 方法。我们知道 StatefulWidget 是一个有状态的 Widget，所以在内部上一 个 StatefulElement 对应一个 State 实例。

StatefulElement 的实现比 StatelessElement 复杂很多，代码就不贴了，主要看看有哪些方法：

![](https://upload-images.jianshu.io/upload_images/877678-33ed2e4fbe490e99.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)

我们只需要掌握两点

* 如何更新 state 和 UI
* 了解 Widget 的生命周期

掌握这两点之后才能更好的利用 StatelessWidget 和 StatefulWidget 实现更多的自定义 Widget。

有关 Widget 的生命周期下一篇会详细说明

### 代码实例
已传置 github [flutter-free](https://github.com/whiskeyfei/flutter-free)