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
    bool private = false,
  }) {
    return '$returns ${private ? '_' : ''}\$$name($args) {$code}';
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
    bool private = false,
  }) {
    final className = '${private ? '_' : ''}\$$name';

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

  static String createCopyWith({
    required String className,
    required Map<String, String> fields,
  }) {
    final args = StringBuffer();
    args.write('{');
    for (var element in fields.entries) {
      final key = element.key;
      args.write(element.key);
      if (key[element.key.length - 1] != '?') args.write('?');
      args.write(' ');
      args.write(element.value + ',');
    }
    args.write('}');

    final code = StringBuffer();
    code.write('return $className(');

    for (var element in fields.entries) {
      final value = element.value;
      code.write(value);
      code.write(':');
      code.write('$value ?? this.$value,');
    }
    code.write(');');

    return createFunc(
      returns: className,
      name: 'copyWith',
      args: args.toString(),
      code: code.toString(),
    );
  }
}
