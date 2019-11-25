/// set get 讲解
/// Getters 和 setters 是用来设置和访问对象属性的特殊 函数。
/// 每个实例变量都隐含的具有一个 getter， 如果变量不是 final 的则还有一个 setter。
/// 你可以通过实行 getter 和 setter 来创建新的属性， 使用 get 和 set 关键字定义 getter 和 setter：
/// getter 和 setter 的好处是，你可以开始使用实例变量，后来 你可以把实例变量用函数包裹起来，而调用你代码的地方不需要修改。

void main() {
  var rect = new Rectangle(3, 4, 20, 15);
  print(rect);
}

class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  num get right => left + width;

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;

  @override
  String toString() {
    return 'Rectangle{left: $left, top: $top, width: $width, height: $height}';
  }

}
