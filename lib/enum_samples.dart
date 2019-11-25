///枚举类型通常称之为 enumerations 或者 enums， 是一种特殊的类，用来表现一个固定 数目的常量。
///使用 enum 关键字来定义枚举类型：
///
void main() {
  Color aColor = Color.blue;
  switch (aColor) {
    case Color.red:
      print('Red as roses!');
      break;
    case Color.green:
      print('Green as grass!');
      break;
    default:
      print(aColor);  // 'Color.blue'
  }

}

///使用 enum 关键字来定义枚举类型
enum Color {
  red,
  green,
  blue
}