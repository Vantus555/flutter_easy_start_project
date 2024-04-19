import 'package:analyzer/dart/element/element.dart';
import 'package:flutter_easy_start_project_generator/fesp_element_visitor.dart.dart';
import 'package:flutter_easy_start_project_generator/fesp_gen_helper.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';
import 'package:analyzer/dart/constant/value.dart';

Builder FespNodeBuilders(BuilderOptions options) =>
    SharedPartBuilder([FespNodeBuildersGenerator()], 'fespNodeBuilders');

class FespNodeBuildersGenerator
    extends GeneratorForAnnotation<FespNodeBuildersA> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = FespElementVisitor();
    element.visitChildren(visitor);
    final buffer = StringBuffer();
    final func = StringBuffer();

    final data = FespNodeBuildersA.obj(annotation.objectValue);

    int index = 0;
    for (final builder in data.builders) {
      buffer.writeln(_genStructs(builder));

      final returnType = builder.returnType;
      final argsList = builder.argsList.join(',') + ',';
      final name = 'fespBuilder$index';

      // getWidget
      final f = FespGenHelper.createFunc(
        returns: '$returnType',
        name: name,
        args: argsList,
        private: true,
        code: """
          return
            $name != null ?
            $name!(${_getFirstArgs(builder.argsList)})
            : $returnType (${_getSecondArgs(builder)});
        """,
      );
      func.writeln(f);

      index++;
    }

    // copyWith
    int i = 0;
    final copyWithFields = Map.fromEntries(
      visitor.fields.map((element) {
        String type = element.type;

        if (data.invalidTypes.length > i && type.contains('InvalidType')) {
          type = type.replaceFirst('InvalidType', data.invalidTypes[i]);
          i++;
        }

        return MapEntry(
          type,
          element.name,
        );
      }),
    );

    final copyWith = FespGenHelper.createCopyWith(
      className: '${visitor.className}',
      fields: copyWithFields,
    );

    return """${buffer.toString() + FespGenHelper.createExtension(
          name: visitor.className,
          code: func.toString() + copyWith,
        )}""";
  }

  String _genStructs(FespNodeBuilderField builder) {
    final List<String> fields = [];
    final List<String> constructorArgs = [];

    for (final arg in builder.classFields) {
      fields.add('final ${arg.type} ${arg.name}');

      constructorArgs.add(
        FespGenHelper.getConstructorArgs(
          name: arg.name,
          isRequired:
              arg.defaultValue == '' && arg.type[arg.type.length - 1] != '?',
          defaultValue: arg.defaultValue,
        ),
      );
    }

    // copyWith
    final copyWithFields = Map.fromEntries(
      builder.classFields.map((element) {
        return MapEntry(element.type, element.name);
      }),
    );

    final copyWith = FespGenHelper.createCopyWith(
      className: '\$${builder.className}',
      fields: copyWithFields,
    );

    final struct = FespGenHelper.createClass(
      name: builder.className,
      fields: fields,
      constructorArgs: constructorArgs,
      isConstConstructor: true,
      code: copyWith.toString(),
    );

    return struct;
  }

  String _getFirstArgs(List<String> argsList) {
    String res = '';

    for (var i = 0; i < argsList.length; i++) {
      res += 'p$i,';
    }

    return res;
  }

  String _getSecondArgs(FespNodeBuilderField builder) {
    String res = '';

    final length = builder.argsList.length - 1;

    final customFields = builder.customFields;
    final customFieldsString = <String>[];

    for (var element in customFields.entries) {
      res += '${element.key}: ${element.value},';
      customFieldsString.add(element.key);
    }

    for (var element in builder.classFields) {
      final name = element.name;
      if (!customFieldsString.contains(name)) {
        res += '$name: p$length.$name,';
      }
    }

    return res;
  }
}
