>如果你有其他编程语言经验，特别是 Java 和 JavaScript，会很容易上手 Dart， 基本上看一个遍介绍就能掌握了。文章的最后有下面demo 实例 github 链接

### Dart 概况

在上一篇中已经讲过了 Dart 语言的来历和一些语言特性等优点，这里就不再重复赘述了，可以上看上一篇文章介绍。

类似 JavaScript，Dart 是一种面向对象语言，但是它采用类别基础编程。它只允许单一继承，语法风格接近C语言。

Dart 的方法也是对象并且具有一种类型 Function，这意味着方法可以赋值给变量，也可以当做其他方法的参数，也可以把 Dart 类的实例当做方法来调用。

在 Dart 语言中中所有能够使用变量引用的都是对象， 每个对象都是一个类的实例。甚至连数字、方法和 null 都是对象，所有的对象都继承于 Object 类。

Dart 是一个强类型语言，任何变量都是有确定类型。

### 变量声明

1、Object

Object 是Dart所有对象的根基类，包括Function和Null，所以任何类型的数据都可以赋值给Object声明的对象，声明的变量可以在后期改变赋值类型

```dart
   /// 定一个 Object 变量
  Object myObject;
  myObject = 'dart is good';//赋值string类型
  myObject = 998;//又重新赋值num
  print(myObject);

  /// 定一个 dynamic 类型 变量
  dynamic myDynamic;
  myDynamic = "dart is good";
  myDynamic = 999;//又重新赋值num 不会报错
  print(myDynamic);

  ///dynamic与Object不同:dynamic声明的对象编译器会提供所有可能的组合,
  ///而Object声明的对象只能使用Object的属性与方法, 否则编译器会报错
```
2、var

一种不指定类型声明变量的方式,但是只要变量被赋值，类型便会确定，则不能再改变其类型

``` dart
//定义一个变量
  var number = 10;
//  number = 'start';//会报错，因为已经 number = 10 赋值，number 类型就确定了
```

3、final and const

如果你以后不打算修改一个变量，使用 final 或者 const。 一个 final 变量只能赋值一次；一个 const 变量是编译时常量。 （Const 变量同时也是 final 变量。） 顶级的 final 变量或者类中的 final 变量在 第一次使用的时候初始化。

```dart
  //不打算修改一个变量, 一个 final 变量只能赋值一次
  final name2 = 'Bob';
  // name2 = "bbb";//这里在进行赋值操作会报错

  var foo = const [];
  final bar = const [];
  const baz = const [];

  foo = [];//可以改变value
//  bar = [];//不能改变使用 final 标示的变量
//  baz = [];//不能改变使用 const 标示的变量

```
4、内置的类型

这里直接看代码好了

```dart
  //int 和 double 都是 num 的子类
  int x = 1;
  double y = 1.0;

  var x1 = 1;
  var y2 = 1.0;

  // String -> int
  var one = int.parse('1');
  print("String -> int:$one");

  // int -> String
  String oneAsString = 1.toString();
  print("int -> String:$oneAsString");

  ///可以使用单引号或者双引号来创建字符串
  var s1 = '单引号string';
  var s2 = "双引号string";
  print(s1);
  print(s2);

  ///使用三个单引号或者双引号也可以 创建多行字符串对象
  var s3 = '''
  第一行
  第二行
  第三行
''';
  print(s3);

  var count;
  print('Hello, World!');
  print(count);
  printNumber(number);

  ///定义一个有序list
  var list = [1, 2, 3];
  list.forEach(printElement);

  /// 定义一个不变的list
  var constantList = const [1, 2, 3];

  /// 创建一个map
  var gifts = {
// Keys      Values
    'first' : 'partridge',
    'second': 'turtledoves',
    'fifth' : 'golden rings'
  };

  ///同样创建一个map
  var gifts2 = new Map();
  gifts2['first'] = 'partridge';
  gifts2['second'] = 'turtledoves';
  gifts2['fifth'] = 'golden rings';
  print(gifts2);

  /// 创建 一个bool 类型变量
  var isGood = true;
  print(isGood is bool);

// 定义个方法。
printNumber(num aNumber) {
  print('The number is $aNumber.'); // 在控制台打印内容。
}

printElement(element) {
  print(element);
}

  ///List 和 Set 等实现了 Iterable 接口的类还支持 for-in 形式的 遍历
  var collection = [0, 1, 2];
  for (var x in collection) {
    print(x);
  }

/// 可选命名参数，你可以使用这种形式 paramName: value 来指定命名参数
  sayHello(name: "dart",talk: "hello");
  sayHello(name: "dart");
```

### 操作符

大部分操作符含义都是一样的，这里介绍几个 dart 特有的

1、??

```dart
b ??= value; // 如果 b 是 null，则赋值给 b；
             // 如果不是 null，则 b 的值保持不变
```
2、？

条件成员访问	和 . 类似，但是左边的操作对象不能为 null，例如 foo?.bar 如果 foo 为 null 则返回 null，否则返回 bar 成员

### 异步

Dart 有一些语言特性来支持 异步编程。 最常见的特性是 `async` 方法和 `await` 表达式。

Dart 库中有很多返回 Future 或者 Stream 对象的方法。 这些方法是 *异步的*： 这些函数在设置完基本的操作 后就返回了， 而无需等待操作执行完成。 例如读取一个文件，在打开文件后就返回了。

有两种方式可以使用 Future 对象中的 数据：

*   使用 `async` 和 `await`
*   使用 Future API

同样，从 Stream 中获取数据也有两种 方式：

*   使用 `async` 和一个 *异步 for 循环* (`await for`)
*   使用 Stream API

要使用 await，其方法必须带有 async 关键字

```dart
lookUpVersion(){
}

checkVersion() async {
  var version = await lookUpVersion();
}

/// 假设getName 是异步操作
String getName(String name){
  return 'dart$name';
}

void sayDart() async {
  try{
    String name1 = await getName("1");
    String name2 = await getName(name1);
    print(name1+name2);
    //执行接下来的操作
  } catch(e){
    //错误处理
    print(e);
  }
}
```

Future.then：

```dart
  /// Future.delayed 创建了一个延时任务
  Future.delayed(new Duration(seconds: 5),(){
    return "Hello, World!";
  }).then((data){
    print(data);
  });
```
Future.wait:

处理多个异步任务

```dart
  /// Future.wait 执行多个异步任务
  Future.wait([
    Future.delayed(new Duration(seconds: 1), () {
      return "Hello, World 1!";
    }),
    Future.delayed(new Duration(seconds: 2), () {
      return "Hello, World 2!";
    })
  ]).then((results){
    print(results);
  }).catchError((e){
    print(e);
  });
```

### 总结

通过上面的基本介绍和代码解释，对 Dart 的基本语法和类型系统有了一个初步的了解，也知道编写的规则了。就像在开头说的如果你已经又其他编程语言的基础，上手 Dart 语言应该非常容易 。

像 if-else、for循环、while、do-while、break、continue、switch-case 等流程控制语法和其他编程语言大同小异，这里就不做一一介绍了。

更多的 Dart 语言特性需要你在后续的使用过程中慢慢学习。我们可以参考官方文档[https://api.dartlang.org/stable/2.2.0/index.html](https://api.dartlang.org/stable/2.2.0/index.html)

### 代码实例
已传置 github [flutter-free](https://github.com/whiskeyfei/flutter-free)

### 参考学习

[http://dart.goodev.org/guides/get-started](http://dart.goodev.org/guides/get-started) 很好的对比学习网站

