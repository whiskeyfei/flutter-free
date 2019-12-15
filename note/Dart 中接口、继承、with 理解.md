> 接口、继承我们已经很熟悉了，任何一门编程语言都离不来，dart 种增加了一种 with 方式，通过非继承的方式使用其他类中的变量与方法， 通过一个demo来理解下 with 使用.

![](https://upload-images.jianshu.io/upload_images/877678-e2e39e70b85302ea.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/440)


在 Dart 中，你可以对同一个父类进行继承或接口实现：

* 继承：子类由父类派生，会自动获取父类的成员变量和方法实现，子类可以根据需要覆写构造函数及父类方法；
* 接口：子类获取到的仅仅是接口的成员变量符号和方法符号，需要重新实现成员变量，以及方法的声明和初始化。

除了继承和接口方式，Dart 还提供了另一种机制来实现类的复用，即“混入”（Mixin）。混入鼓励代码重用，可以被视为具有实现方法的接口

```
/// 学习 dart with使用

void main() {
  SourApple sourApple = new SourApple();
  sourApple.eat();
}

/// 定义一个榨汁机
class AppleJuicer {
  void juice() {
    print("榨汁");
  }
}

/// 定义一个 Apple 类,dart 种没有 interface 关键字
class Apple {
  void eat() {}
}

/// 定义一个 BigApple 类继承Apple
class BigApple extends Apple {

}

/// 定义一个 SmallApple 类实现Apple类
class SmallApple implements Apple {
  /// 必须实现重写父类方法
  @override
  void eat() {}
}

class SourApple with AppleJuicer implements Apple {

  @override
  void eat() {
    print("eat start");
    juice();
    print("eat end");
  }

}

```

输出结果：
```
lib/dart_with.dart: Warning: Interpreting this as package URI, 'package:flutter_free/dart_with.dart'.
eat start
榨汁
eat end

Process finished with exit code 0

```
