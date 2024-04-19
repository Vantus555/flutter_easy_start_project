import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:source_gen/source_gen.dart';

class VisitorElement {
  final String name;
  final String type;
  final String? returnType;
  final List<String> argsList;
  final String argsString;
  final bool isFunction;
  final List<DartObject> annotations;

  VisitorElement({
    required this.name,
    required this.type,
    this.returnType,
    this.argsList = const [],
    this.argsString = '',
    this.isFunction = false,
    this.annotations = const [],
  });

  DartObject? getAnnotationByName(String name) {
    final res = annotations
        .where(
          (element) => element.type.toString() == name,
        )
        .toList();

    if (res.length > 0) return res[0];
    return null;
  }
}

class FespElementVisitor extends SimpleElementVisitor<void> {
  String className = '';
  List<VisitorElement> fields = [];
  TypeChecker? fieldChecker;

  FespElementVisitor({
    this.fieldChecker,
  });

  @override
  void visitConstructorElement(ConstructorElement element) {
    final returnType = element.returnType.toString();
    className = returnType.replaceFirst('*', '');
  }

  @override
  void visitFieldElement(FieldElement element) {
    final value = element.type.toString().replaceFirst('*', '');

    if (value.contains('Function')) {
      List<String> splitter = value.split('Function');
      String returnType = splitter[0];
      String argsString = splitter[1];

      if (argsString.substring(argsString.length - 2) == ')?')
        argsString = argsString
            .substring(0, argsString.length - 2)
            .replaceAll('(', '')
            .replaceAll(')', '');

      List<String> argsList = [];

      if (argsString.isNotEmpty) {
        int index = 0;
        argsList = argsString.split(',');

        argsString = argsList.map((e) {
              String res = '${e} p${index}';
              index++;
              if (argsList.length == index) {
                res += ',';
              }
              return res;
            }).join(',') +
            ',';
        ;
      }

      fields.add(
        VisitorElement(
          name: element.name,
          type: value,
          returnType: returnType,
          argsList: argsList,
          argsString: argsString,
          isFunction: true,
          annotations: _getAnnotations(element),
        ),
      );
    } else {
      fields.add(
        VisitorElement(
          name: element.name,
          type: value,
          annotations: _getAnnotations(element),
        ),
      );
    }
  }

  List<DartObject> _getAnnotations(FieldElement element) {
    return fieldChecker != null
        ? fieldChecker!.annotationsOfExact(element).toList()
        : [];
  }
}
