import 'package:analyzer/dart/element/element.dart';
import 'package:flutter_easy_start_project_generator/fesp_element_visitor.dart.dart';
import 'package:flutter_easy_start_project_generator/fesp_gen_helper.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

Builder FespNodeBuilders(BuilderOptions options) =>
    SharedPartBuilder([FespNodeBuildersGenerator()], 'fespNodeBuilders');

class FespNodeBuildersA {
  const FespNodeBuildersA();
}

class FespNodeBuilderFieldA {
  final List<String> classFields;
  final List<String> customFields;
  const FespNodeBuilderFieldA({
    this.classFields = const [],
    this.customFields = const [],
  });
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

    for (final e in visitor.fields) {
      if (!e.name.startsWith('fespBuilder')) continue;
      if (!e.isFunction) continue;

      final func = FespGenHelper.func(
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
      buffer.writeln(func);
    }

    return FespGenHelper.extensionOn(
      name: visitor.className,
      code: buffer.toString(),
    );
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

    forE(String fieldName, String Function(String) getLine) {
      final annotations = e.annotations
          .where(
            (element) => element.type.toString() == 'FespNodeBuilderFieldA',
          )
          .toList();

      if (annotations.length > 0) {
        final anno = e.annotations[0];
        for (var element in anno.getField(fieldName)!.toListValue()!) {
          final arg = element.toStringValue();
          res += getLine(arg!);
        }
      }
    }

    forE(
      'classFields',
      (p0) => '$p0: p$length.$p0,',
    );

    forE(
      'customFields',
      (p0) => '$p0,',
    );

    return res;
  }
}
