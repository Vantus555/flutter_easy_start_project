import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

Builder FespOverrideBuilder(BuilderOptions options) =>
    SharedPartBuilder([FespOverrideBuilderGenerator()], 'FespOverrideBuilder');

class FespOverrideBuilderGenerator
    extends GeneratorForAnnotation<FespOverrideBuilderA> {
  @override
  String generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    throw "Hello";
  }
}

class FespOverrideBuilderA {
  const FespOverrideBuilderA();
}
