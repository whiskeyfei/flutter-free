>本文主要讲解在 Mac 环境下搭建 Flutter 环境

![](https://upload-images.jianshu.io/upload_images/877678-89b30422b97ae334.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)

### 准备工作

1、安装 Android Studio
直接下载安装 [https://developer.android.com/studio/index.html?hl=zh-cn](https://developer.android.com/studio/index.html?hl=zh-cn)，如果你已经具备了Android 开发环境，就不必安装了，下载好一顿点就ok。

2、安装 Flutter SDK

 *下载SDK安装包 [https://flutter.dev/docs/development/tools/sdk/releases#macos](https://flutter.dev/docs/development/tools/sdk/releases#macos)

![image.png](https://upload-images.jianshu.io/upload_images/877678-d06e9e106f1aee90.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)

* 将下载好的zip包解压到你想安装的目录

```
cd ~/dev
unzip ~/Downloads/flutter_macos_v1.9.1+hotfix.6-stable.zip
```
* 将 Flutter 目录添加环境变量

```
export PATH=`pwd`/flutter/bin:$PATH
```

3、Android Studio 安装 Flutter 和 Dart 插件

Flutter插件： 支持Flutter开发工作流 (运行、调试、热重载等)。
Dart插件： 提供代码分析 (输入代码时进行验证、代码补全等)。

![](https://upload-images.jianshu.io/upload_images/877678-4e854a71acab8c34.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)

![](https://upload-images.jianshu.io/upload_images/877678-7d740d79278d0def.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)

下载好插件重启 Android Studio 就可以创建 Flutter 工程了

![](https://upload-images.jianshu.io/upload_images/877678-cd1d8fdb1a8e69c5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/640)

熟悉的操作台

![](https://upload-images.jianshu.io/upload_images/877678-10fd4ae37bda4972.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/840)

运行效果

![](https://upload-images.jianshu.io/upload_images/877678-0dee96d24b69b7e4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/540)

### 使用镜像

由于在国内访问Flutter有时可能会受到限制，Flutter官方为中国开发者搭建了临时镜像，大家可以将如下环境变量加入到用户环境变量中：

```
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

如果遇到一直在loading问题，可以修改 Android 工程下面的 build.gradle 文件，例如：

```
buildscript {
    repositories {
//        google()
//        jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:3.2.1'
    }
}

allprojects {
    repositories {
//        google()
//        jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'http://maven.aliyun.com/nexus/content/groups/public' }
    }
}
```

好了，安装上了 Flutter，然后就开始快乐的玩耍吧！！

Win环境参考 [https://flutterchina.club/setup-macos/](https://flutterchina.club/setup-macos/)

### 代码实例
已传置 github [flutter-free](https://github.com/whiskeyfei/flutter-free)