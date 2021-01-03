import 'package:url_launcher/url_launcher.dart';
class LaunchUtils{

  static _launchUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// 调起拨号页
  static void launchTelURL(String phone) async {
    String url = 'tel:'+ phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
    }
  }

  static void launchURL(String url) async {
    _launchUrl(url);
  }

  static void launchEmailURL(String path,{Map<String, dynamic> queryParameters }) async {
    final Uri _emailUri = Uri(
        scheme: 'mailto',
        path: path,
        queryParameters: queryParameters
    );
    _launchUrl(_emailUri.toString());
  }


}