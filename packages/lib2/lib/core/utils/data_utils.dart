class DataUtils {
  static Map<T, D> join<T, D>(List<Map<T, D>> maps) {
    Map<T, D> joined = {};
    maps.forEach((map) {
      joined.addAll(map);
    });
    return joined;
  }
}
