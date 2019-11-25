///JSON和序列化
///使用插件 json_serializable 、build_runner、json_annotation
///有了json_serializable，我们可以在User类上忘记任何手动的JSON序列化 。
///源代码生成器创建一个名为user.g.dart的文件，它具有所有必需的序列化逻辑。
/// 现在，我们不必编写自动化测试来确保序列化的正常工作 - 这个库会确保序列化工作正常。


import 'package:json_annotation/json_annotation.dart';

/// user.g.dart 将在我们运行生成命令后自动生成
part 'user.g.dart';

///这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User {

  User(this.name, this.email);

  String name;
  String email;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}
