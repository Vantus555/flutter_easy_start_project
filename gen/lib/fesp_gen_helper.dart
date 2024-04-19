class FespGenHelper {
  static String extensionOn({
    required String name,
    required String code,
  }) {
    return 'extension on $name {$code}';
  }

  static String func({
    required String returns,
    required String name,
    String args = '',
    required String code,
  }) {
    return '$returns _\$$name($args) {$code}';
  }
}
