import 'package:analyzer/dart/constant/value.dart';

class FespNodeBuildersA {
  final List<FespNodeBuilderField> builders;
  final List<String> invalidTypes;

  const FespNodeBuildersA({
    required this.builders,
    this.invalidTypes = const [],
  });

  factory FespNodeBuildersA.obj(DartObject e) {
    return FespNodeBuildersA(
      builders: e
          .getField('builders')!
          .toListValue()!
          .map(
            (e) => FespNodeBuilderField.obj(e),
          )
          .toList(),
      invalidTypes: e
          .getField('invalidTypes')!
          .toListValue()!
          .map(
            (e) => e.toStringValue()!,
          )
          .toList(),
    );
  }
}

class FespNodeBuilderClassField {
  final String type;
  final String name;
  final String defaultValue;

  const FespNodeBuilderClassField({
    required this.type,
    required this.name,
    this.defaultValue = '',
  });

  factory FespNodeBuilderClassField.obj(DartObject e) {
    return FespNodeBuilderClassField(
      name: e.getField('name')!.toStringValue()!,
      type: e.getField('type')!.toStringValue()!,
      defaultValue: e.getField('defaultValue')!.toStringValue()!,
    );
  }
}

class FespNodeBuilderField {
  final String className;
  final List<String> argsList;
  final List<FespNodeBuilderClassField> classFields;
  final Map<String, String> customFields;
  final String returnType;

  const FespNodeBuilderField({
    required this.className,
    this.argsList = const [],
    required this.returnType,
    this.classFields = const [],
    this.customFields = const {},
  });

  factory FespNodeBuilderField.obj(DartObject e) {
    final className = e.getField('className')!.toStringValue()!;
    return FespNodeBuilderField(
      className: className,
      argsList: getArgsList(e, className),
      returnType: e.getField('returnType')!.toStringValue()!,
      classFields: e.getField('classFields')!.toListValue()!.map((e) {
        return FespNodeBuilderClassField.obj(e);
      }).toList(),
      customFields: getCustomFields(e),
    );
  }

  static Map<String, String> getCustomFields(DartObject e) {
    final Map<String, String> res = {};

    final map = e.getField('customFields')!.toMapValue()!;

    for (var element in map.entries) {
      res[element.key!.toStringValue()!] = element.value!.toStringValue()!;
    }

    return res;
  }

  static List<String> getArgsList(DartObject e, String className) {
    var list = e.getField('argsList')!.toListValue()!;
    if (list.length == 0) {
      return [
        'BuildContext p0',
        '\$$className p1',
      ];
    }
    int index = 0;
    return list.map((e) {
      final p = ' p$index';
      index++;
      return e.toStringValue()! + p;
    }).toList();
  }
}
