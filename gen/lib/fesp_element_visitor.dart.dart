import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:source_gen/source_gen.dart';

class VisitorElement {
  final String name;
  final String type;
  final List<String> argsList;
  final String argsString;
  final bool isFunction;
  final List<DartObject> annotations;

  VisitorElement({
    required this.name,
    required this.type,
    this.argsList = const [],
    this.argsString = '',
    this.isFunction = false,
    this.annotations = const [],
  });
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
      String type = splitter[0];
      String argsString = splitter[1].replaceAll('(', '').replaceAll(')', '');

      if (argsString.substring(argsString.length - 1) == '?')
        argsString = argsString.substring(0, argsString.length - 1);

      List<String> argsList = [];

      if (argsString.isNotEmpty) {
        int index = 0;
        argsList = argsString.split(',');

        argsString = argsList
            .map((e) {
              String res = '${e} p${index}';
              index++;
              if (argsList.length == index) {
                res += ',';
              }
              return res;
            })
            .toString()
            .replaceAll('(', '')
            .replaceAll(')', '');
        ;
      }

      fields.add(
        VisitorElement(
          name: element.name,
          type: type,
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
