/// 学习 dart with使用
/// 混入（mixin） 指的是可以将一个或多个类的功能添加到自己的类中，而无需继承这些类。
/// 混入后可以调用这些类中的方法。Dart 中没有多继承，可以使用 混入（mixin）来避免多重继承会导致的问题。

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
