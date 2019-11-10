/// 说明 dart 基础语法
///
/// 和 Java 不同的是，Dart 没有 public、 protected、 和 private 关键字。如果一个标识符以 (_) 开头，则该标识符 在库内是私有的
/// 所有能够使用变量引用的都是对象， 每个对象都是一个类的实例
///
/// dart 运行入口 main 函数
void main() {

  /// 一种不指定类型声明变量的方式,但是只要变量被赋值，类型便会确定，则不能再改变其类型

  //定义一个变量
  var number = 10;
//  number = 'start';//会报错，因为已经 number = 10 赋值，number 类型就确定了

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

  //变量是一个引用。上面名字为 name 的变量引用了 一个内容为 “Bob” 的 String 对象。
  var name = 'Bob';

  // 制定具体类型
  String name1 = 'Bob';

  //不打算修改一个变量, 一个 final 变量只能赋值一次
  final name2 = 'Bob';
//  name2 = "bbb";//这里在进行赋值操作会报错

  var foo = const [];
  final bar = const [];
  const baz = const [];

  foo = [];//可以改变value
//  bar = [];//不能改变使用 final 标示的变量
//  baz = [];//不能改变使用 final 标示的变量

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

  /// 可选命名参数，你可以使用这种形式 paramName: value 来指定命名参数
  sayHello(name: "dart",talk: "hello");
  sayHello(name: "dart");

  ///List 和 Set 等实现了 Iterable 接口的类还支持 for-in 形式的 遍历
  var collection = [0, 1, 2];
  for (var x in collection) {
    print(x);
  }

  /// Future.delayed 创建了一个延时任务
  Future.delayed(new Duration(seconds: 5),(){
    return "Hello, World!";
  }).then((data){
    print(data);
  });

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

}

// 定义个方法。
printNumber(num aNumber) {
  print('The number is $aNumber.'); // 在控制台打印内容。
}

void sayHello({String name, String talk}){
  print("name$name,talk$talk");
}

printElement(element) {
  print(element);
}

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


