import 'package:flutter/material.dart';
import '../../../../../../flutter_easy_start_project/lib/forms/my_app_text_field.dart';
import 'package:provider/provider.dart';

class _MyAppListSearcherProvider extends ChangeNotifier {
  String _searchValue = '';

  String get searchValue => _searchValue;
  set searchValue(String value) {
    _searchValue = value;
    notifyListeners();
  }
}

class MyAppListSearcher<T> extends StatelessWidget {
  final List<T> children;
  final String labelText;
  final Widget? Function(T element, int index, String value) onChange;

  const MyAppListSearcher({
    super.key,
    this.labelText = 'Поиск',
    required this.onChange,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MyAppListSearcherProvider(),
      builder: (context, child) {
        final provider = context.read<_MyAppListSearcherProvider>();

        return Column(
          children: [
            MyAppTextField(
              labelText: labelText,
              onChanged: (value) => provider.searchValue = value,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _MyAppListSearcherValues<T>(
                onChange: onChange,
                children: children,
              ),
            )
          ],
        );
      },
    );
  }
}

class _MyAppListSearcherValues<T> extends StatelessWidget {
  final Widget? Function(T element, int index, String value) onChange;
  final List<T> children;

  const _MyAppListSearcherValues({
    required this.onChange,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final searchValue = context.select(
      (_MyAppListSearcherProvider value) => value.searchValue,
    );

    List<Widget> results = [];

    for (var i = 0; i < children.length; i++) {
      Widget? child = onChange(
        children[i],
        i,
        searchValue,
      );

      if (child != null) results.add(child);
    }

    return ListView.builder(
      itemBuilder: (context, index) => SizedBox(
        key: UniqueKey(),
        child: results[index],
      ),
      itemCount: results.length,
    );
  }
}
