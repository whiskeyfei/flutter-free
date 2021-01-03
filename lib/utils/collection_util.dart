/// collection Util.
class CollectionUtil {

  /// Returns true if the list is null or 0-length.
  static bool isEmptyList(List list) {
    return list == null || list.isEmpty;
  }

  /// Returns true if there is no key/value pair in the map.
  static bool isEmptyMap(Map map) {
    return map == null || map.isEmpty;
  }

  /// 获取list大小
  static int safeListSize(List list){
    return isEmptyList(list) ? 0 : list.length;
  }

  /// 获取map大小
  static int safeMapSize(Map map){
    return isEmptyMap(map) ? 0 : map.length;
  }

}
