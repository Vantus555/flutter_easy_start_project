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
    bool private = true,
    bool isGenerated = true,
  }) {
    return '$returns ${getSymbols(private, isGenerated)}$name($args) {$code}';
  }

  static String createVar({
    required String type,
    required String name,
    bool private = false,
  }) {
    return '$type ${getSymbols(private, false)}$name;';
  }

  static String getSymbols(bool private, bool isGenerated) {
    return (private ? '_' : '') + (isGenerated ? '\$' : '');
  }

  static String createClass({
    required String name,
    String typeClass = 'class',
    String inherit = '',
    List<String> fields = const [],
    List<String> constructorArgs = const [],
    String constructorCode = '',
    bool isConstConstructor = false,
    String code = '',
    bool private = true,
    bool isGenerated = true,
  }) {
    final className = '${getSymbols(private, isGenerated)}$name';

    return """
$typeClass $className $inherit {
  ${join(iter: fields)}

  ${isConstConstructor ? 'const' : ''} $className({${join(iter: constructorArgs, char: ',')}})
  ${isConstConstructor ? ';' : '{$constructorCode}'}
  $code
}""";
  }

  static String getConstructorArg({
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
      final value = element.value;
      args.write(value);
      if (value[value.length - 1] != '?') args.write('?');
      args.write(' ');
      args.write(element.key + ',');
    }
    args.write('}');

    final code = StringBuffer();
    code.write('return $className(');

    for (var element in fields.entries) {
      final key = element.key;
      code.write(key);
      code.write(':');
      code.write('$key ?? this.$key,');
    }
    code.write(');');

    return createFunc(
      returns: '// ignore: unused_element\n' + className,
      name: 'copyWith',
      args: args.toString(),
      code: code.toString(),
      private: false,
      isGenerated: false,
    );
  }

  static String join({required Iterable iter, String char = ''}) {
    return iter.join(char) + (iter.length != 0 ? char : '');
  }
}
