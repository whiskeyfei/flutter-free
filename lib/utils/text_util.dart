/// TextUtil.
class TextUtil {

  /// isEmpty
  static bool isEmpty(String text) {
    return text == null || text.isEmpty;
  }

  /// replace
  static String replace(String text, Pattern from, String replace) {
    return text?.replaceAll(from, replace);
  }

  /// split
  static List<String> split(String text, Pattern pattern,
      {List<String> defValue = const []}) {
    List<String> list = text?.split(pattern);
    return list ?? defValue;
  }

  /// reverse
  static String reverse(String text) {
    if (isEmpty(text)) return '';
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      sb.writeCharCode(text.codeUnitAt(i));
    }
    return sb.toString();
  }
}
