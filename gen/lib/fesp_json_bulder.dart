import 'package:analyzer/dart/element/element.dart';
import 'package:flutter_easy_start_project_generator/fesp_element_visitor.dart.dart';
import 'package:flutter_easy_start_project_generator/fesp_gen_helper.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

Builder FespJsonBuilder(BuilderOptions options) =>
    SharedPartBuilder([FespJsonBuilderGenerator()], 'fespJsonBuilder');

class FespJsonA {
  const FespJsonA();
}

class FespJsonBuilderGenerator extends GeneratorForAnnotation<FespJsonA> {
  @override
  String generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    final visitor = FespElementVisitor();
    element.visitChildren(visitor);

    final buffer = StringBuffer();

    final name = visitor.className;

    buffer.writeln("""
factory $name.fromJson(Map<String, dynamic> json) => _\$${name}Json(json);
Map<String, dynamic> toJson() => _\$${name}ToJson(this);
""");

    return FespGenHelper.createExtension(
      name: name,
      code: buffer.toString(),
    );
  }
}
