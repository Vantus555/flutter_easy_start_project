import 'package:analyzer/dart/element/element.dart';
import 'package:flutter_easy_start_project_generator/fesp_element_visitor.dart.dart';
import 'package:flutter_easy_start_project_generator/fesp_gen_helper.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

Builder FespReflectorBuilder(BuilderOptions options) =>
    SharedPartBuilder([FespReflectorGenerator()], 'fespReflector');

class FespReflectorA {
  const FespReflectorA();
}

class FespReflectorGenerator extends GeneratorForAnnotation<FespReflectorA> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = FespElementVisitor();
    element.visitChildren(visitor);
    final buffer = StringBuffer();

    code() {
      String res = 'return [';
      for (var e in visitor.fields) {
        res += '\'' + '${e.name}' + '\'' + ',';
      }
      return res + '];';
    }

    final func = FespGenHelper.createFunc(
      returns: 'static List<String>',
      name: 'getFields',
      code: code(),
    );

    buffer.writeln(func);
    return FespGenHelper.createExtension(
      name: visitor.className,
      code: buffer.toString(),
    );
  }
}
