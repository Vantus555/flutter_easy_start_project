class FespGenHelper {
  static String createExtension({
    required String name,
    required String code,
  }) {
    return 'extension on $name {$code}';
  }

  static String createFunc({
    required String returns,
    required String name,
    String args = '',
    required String code,
  }) {
    return '$returns _\$$name($args) {$code}';
  }

  static String createClass({
    required String name,
    String typeClass = 'class',
    String modifyers = '',
    List<String> fields = const [],
    List<String> constructorArgs = const [],
    String constructorCode = '',
    bool isConstConstructor = false,
    String code = '',
  }) {
    final className = '\$$name';

    return """
$typeClass $className $modifyers {
  ${fields.join(';\n') + ';\n'}

  ${isConstConstructor ? 'const' : ''} $className({${constructorArgs.join(',') + ','}})
  ${isConstConstructor ? ';' : '{$constructorCode}'}
  $code
}""";
  }

  static String getConstructorArgs({
    required String name,
    bool isRequired = false,
    String defaultValue = '',
  }) {
    String res = '';
    if (isRequired) {
      res += 'required ';
    }
    res += 'this.$name ${defaultValue == '' ? '' : '= $defaultValue'}';
    return res;
  }
}
