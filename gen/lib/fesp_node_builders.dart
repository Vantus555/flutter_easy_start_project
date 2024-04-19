import 'package:analyzer/dart/element/element.dart';
import 'package:flutter_easy_start_project_generator/fesp_element_visitor.dart.dart';
import 'package:flutter_easy_start_project_generator/fesp_gen_helper.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:analyzer/dart/constant/value.dart';

Builder FespNodeBuilders(BuilderOptions options) =>
    SharedPartBuilder([FespNodeBuildersGenerator()], 'fespNodeBuilders');

class FespNodeBuildersA {
  const FespNodeBuildersA();
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

  static Map<String, String> getClassFieldsAsJson(DartObject obj) {
    return {
      'type': obj.getField('type')!.toStringValue()!,
      'name': obj.getField('name')!.toStringValue()!,
      'defaultValue': obj.getField('defaultValue')!.toStringValue()!,
    };
  }
}

class FespNodeBuilderFieldA {
  final String classNmae;
  final List<FespNodeBuilderClassField> classFields;
  final Map<String, String> customFields;
  const FespNodeBuilderFieldA({
    required this.classNmae,
    this.classFields = const [],
    this.customFields = const {},
  });

  static Map<String, String> getCustomFieldAsJson(
      MapEntry<DartObject?, DartObject?> element) {
    return {
      'key': element.key!.toStringValue()!,
      'value': element.value!.toStringValue()!,
    };
  }
}

class FespNodeBuildersGenerator
    extends GeneratorForAnnotation<FespNodeBuildersA> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = FespElementVisitor(
      fieldChecker: const TypeChecker.fromRuntime(FespNodeBuilderFieldA),
    );
    element.visitChildren(visitor);
    final buffer = StringBuffer();
    final func = StringBuffer();

    for (final e in visitor.fields) {
      if (!e.name.startsWith('fespBuilder')) continue;
      if (!e.isFunction) continue;
      buffer.writeln(_genStructs(e));

      final f = FespGenHelper.createFunc(
        returns: e.type,
        name: e.name,
        args: e.argsString,
        code: """
          return
            ${e.name} != null ?
            ${e.name}!(${_getFirstArgs(e)})
            : ${e.type} (${_getSecondArgs(e)});
        """,
      );
      func.writeln(f);
    }

    return """/*${buffer.toString() + FespGenHelper.createExtension(
          name: visitor.className,
          code: func.toString(),
        )}*/""";
  }

  String _genStructs(VisitorElement e) {
    final anno = e.getAnnotationByName('FespNodeBuilderFieldA');

    if (anno == null) return '';
    final className = anno.getField('classNmae')!.toStringValue();
    final argList = anno.getField('classFields')!.toListValue();
    final List<String> fields = [];
    final List<String> constructorArgs = [];

    for (final arg in argList!) {
      final data = FespNodeBuilderClassField.getClassFieldsAsJson(arg);
      fields.add('final ${data['type']} ${data['name']}');

      constructorArgs.add(
        FespGenHelper.getConstructorArgs(
          name: data['name']!,
          isRequired: data['defaultValue'] == '',
          defaultValue: data['defaultValue']!,
        ),
      );
    }

    final struct = FespGenHelper.createClass(
      name: className!,
      fields: fields,
      constructorArgs: constructorArgs,
      isConstConstructor: true,
    );

    return struct;
  }

  String _getFirstArgs(VisitorElement e) {
    String res = '';
    for (var i = 0; i < e.argsList.length; i++) {
      res += 'p$i,';
    }

    return res;
  }

  String _getSecondArgs(VisitorElement e) {
    String res = '';

    final length = e.argsList.length - 1;
    final anno = e.getAnnotationByName('FespNodeBuilderFieldA');

    if (anno == null) return res;

    final classField = anno.getField('classFields')!.toListValue()!;
    final customFields = anno.getField('customFields')!.toMapValue()!;
    final customFieldsString = <String>[];

    for (var element in customFields.entries) {
      final data = FespNodeBuilderFieldA.getCustomFieldAsJson(element);
      res += '${data['key']}: ${data['value']},';
      customFieldsString.add(data['key']!);
    }

    for (var element in classField) {
      final data = FespNodeBuilderClassField.getClassFieldsAsJson(element);

      if (!customFieldsString.contains(data['name'])) {
        res += '${data['name']}: p$length.${data['name']},';
      }
    }

    return res;
  }
}
