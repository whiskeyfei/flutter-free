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
