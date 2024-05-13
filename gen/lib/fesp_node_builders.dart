import 'package:analyzer/dart/element/element.dart';
import 'package:flutter_easy_start_project_generator/fesp_element_visitor.dart.dart';
import 'package:flutter_easy_start_project_generator/fesp_gen_helper.dart';
import 'package:flutter_easy_start_project_generator/fesp_node_classes.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

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
    final funcs = StringBuffer();
    final vars = <String>[];
    final constructorArgs = <String>[];

    final data = FespNodeBuildersA.obj(annotation.objectValue);
    _genStructs(buffer, vars, constructorArgs, funcs, data);
    final copyWith = _getCoptWith(visitor, vars, data);

    return """${buffer.toString() + FespGenHelper.createClass(
              name: visitor.className,
              inherit: data.inherit,
              constructorArgs: constructorArgs,
              fields: vars,
              code: funcs.toString(),
              isConstConstructor: true,
            ) + FespGenHelper.createExtension(
              name: visitor.className,
              code: copyWith,
            )}
    """;
  }

  String _getCoptWith(
    FespElementVisitor visitor,
    List<String> fields,
    FespNodeBuildersA data,
  ) {
    int i = 0;

    final forE = (
      Iterable iter,
      String Function(dynamic p) typef,
      String Function(dynamic p) namef,
    ) =>
        Map.fromEntries(
          iter.map(
            (element) {
              String type = typef(element);
              String name = namef(element);

              if (data.invalidTypes.length > i &&
                  type.contains('InvalidType')) {
                type = type.replaceFirst('InvalidType', data.invalidTypes[i]);
                i++;
              }

              return MapEntry(
                name,
                type,
              );
            },
          ),
        );

    final copyWithFields1 = forE(
      fields,
      (p) => p.substring(0, p.lastIndexOf(' ')).replaceAll(';', ''),
      (p) => p.substring(p.lastIndexOf(' ')).replaceAll(';', ''),
    );

    final copyWithFields2 = forE(
      visitor.fields,
      (p) => (p as VisitorElement).type,
      (p) => (p as VisitorElement).name,
    );

    copyWithFields1.addAll(copyWithFields2);

    return FespGenHelper.createCopyWith(
      className: '${visitor.className}',
      fields: copyWithFields1,
    );
  }

  void _genStructs(
    StringBuffer buffer,
    List<String> vars,
    List<String> constructorArgs,
    StringBuffer funcs,
    FespNodeBuildersA data,
  ) {
    int index = 0;
    for (final builder in data.builders) {
      buffer.writeln(_genStruct(builder));

      final returnType = builder.returnType;
      final argsList = FespGenHelper.join(iter: builder.argsList, char: ',');
      final name = 'fespBuilder$index';

      // getWidgetFunc
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
      funcs.writeln(f);

      // var
      final varType = 'final ${builder.returnType} Function($argsList)?';
      vars.add(
        FespGenHelper.createVar(
          type: varType,
          name: name,
        ),
      );

      constructorArgs.add(
        FespGenHelper.getConstructorArg(name: name),
      );

      index++;
    }
  }

  String _genStruct(FespNodeBuilderField builder) {
    final List<String> fields = [];
    final List<String> constructorArgs = [];

    for (final arg in builder.classFields) {
      fields.add(
        FespGenHelper.createVar(type: 'final ${arg.type}', name: arg.name),
      );

      constructorArgs.add(
        FespGenHelper.getConstructorArg(
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
        return MapEntry(element.name, element.type);
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
      private: false,
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

    // by position
    final list = builder.classFields
        .where(
          (element) => element.position != null,
        )
        .toList();

    list.sort(
      (a, b) => a.position! > b.position! ? a.position! : b.position!,
    );
    for (var element in list) {
      final name = element.name;
      res = 'p$length.$name,' + res;
    }

    // by name
    for (var element in builder.classFields.where(
      (element) => element.position == null,
    )) {
      final name = element.name;
      if (!customFieldsString.contains(name)) {
        res = '$name: p$length.$name,' + res;
      }
    }

    return res;
  }
}
