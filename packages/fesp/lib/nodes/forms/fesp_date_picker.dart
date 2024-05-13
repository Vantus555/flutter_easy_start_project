import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text_field.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
typedef _providerType = FespValueChangeProvider<DateTime?>;

class FespDatePicker extends StatelessWidget {
  final DateTime initialValue;
  final String dateFormat;
  final int positiveYears;
  final int negativeYears;
  final Function(DateTime? date)? onChange;
  final bool readOnly;
  final String labelText;

  const FespDatePicker({
    super.key,
    this.negativeYears = 100,
    this.positiveYears = 100,
    this.readOnly = false,
    this.labelText = 'Дата',
    this.onChange,
    this.dateFormat = 'dd.M.yyyy',
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _providerType(
        value: initialValue,
      ),
      builder: (context, child) {
        final provider = context.watch<_providerType>();

        return FespTextField(
          data: FespTextFieldData(
            initialValue: provider.getValue() != null
                ? DateFormat(dateFormat).format(provider.getValue()!)
                : '',
            labelText: labelText,
            fespBuilder2: (controller, data) {
              return TextFormField(
                controller: data.controller,
                obscureText: data.obscureText,
                inputFormatters: data.inputFormatters,
                readOnly: readOnly,
                onTap: () {
                  if (!readOnly) {
                    final initialDate = DateTime.now();
                    final firstDate = initialDate.subtract(Duration(
                      days: 365 * negativeYears,
                    ));
                    final lastDate = initialDate.add(Duration(
                      days: 365 * positiveYears,
                    ));

                    showDatePicker(
                      context: context,
                      initialDate: initialValue,
                      firstDate: firstDate,
                      lastDate: lastDate,
                    ).then((value) {
                      provider.setValue(value);
                      if (onChange != null) {
                        onChange!(value);
                      }
                    });
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
