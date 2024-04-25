import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text_field.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
typedef _providerType = FespValueChangeProvider<String>;

class FespListSearcherData<T> {
  final List<T> children;
  final String labelText;
  final Widget? Function(T element, int index, String value) onChange;

  FespListSearcherData({
    this.labelText = '',
    required this.children,
    required this.onChange,
  });
}

class FespListSearcher<T> extends StatelessWidget {
  final FespListSearcherData<T> data;
  const FespListSearcher({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _providerType(value: ''),
      builder: (context, child) {
        final provider = context.read<_providerType>();

        return Column(
          children: [
            FespTextField(
              data: FespTextFieldData(
                labelText: data.labelText,
                fespBuilder2: (p0, p1) {
                  return TextFormField(
                    controller: p1.controller,
                    obscureText: p1.obscureText,
                    inputFormatters: p1.inputFormatters,
                    decoration: p1.decoration,
                    onChanged: (value) {
                      provider.value = value;
                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                      provider.notifyListeners();
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _FespListSearcherValues<T>(
                onChange: data.onChange,
                children: data.children,
              ),
            )
          ],
        );
      },
    );
  }
}

class _FespListSearcherValues<T> extends StatelessWidget {
  final Widget? Function(T element, int index, String value) onChange;
  final List<T> children;

  const _FespListSearcherValues({
    required this.onChange,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final searchValue = context.select(
      (_providerType value) => value.value,
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
