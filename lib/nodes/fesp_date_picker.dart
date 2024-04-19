// import 'package:flutter/material.dart';
// import 'package:flutter_easy_start_project/nodes/fesp_text_field.dart';
// import 'package:intl/intl.dart';

// class FespDatePicker extends StatefulWidget {
//   final int positiveYears;
//   final int negativeYears;
//   final Function(DateTime? date)? onChange;
//   final DateTime? initialValue;
//   final bool readOnly;
//   final String labelText;

//   const FespDatePicker({
//     super.key,
//     this.negativeYears = 100,
//     this.positiveYears = 100,
//     this.readOnly = false,
//     this.labelText = 'Дата',
//     this.onChange,
//     this.initialValue,
//   });

//   @override
//   State<FespDatePicker> createState() => _FespDatePickerState();
// }

// class _FespDatePickerState extends State<FespDatePicker> {
//   DateTime? _currentValue;

//   @override
//   void initState() {
//     _currentValue = widget.initialValue;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FespTextField(
//       data: FespTextFieldData(
//         initialValue: _currentValue != null
//             ? DateFormat('dd.M.yyyy').format(_currentValue!)
//             : '',
//         labelText: widget.labelText,
//         builder3: (controller, obscureText, inputFormatters) {
//           return TextFormField(
//             controller: controller,
//             obscureText: obscureText,
//             inputFormatters: inputFormatters,
//             readOnly: widget.readOnly,
//             onTap: () {
//               if (!widget.readOnly) {
//                 final initialDate = DateTime.now();
//                 final firstDate = initialDate.subtract(Duration(
//                   days: 365 * widget.negativeYears,
//                 ));
//                 final lastDate = initialDate.add(Duration(
//                   days: 365 * widget.positiveYears,
//                 ));

//                 showDatePicker(
//                   context: context,
//                   initialDate: widget.initialValue ?? DateTime.now(),
//                   firstDate: firstDate,
//                   lastDate: lastDate,
//                 ).then((value) {
//                   _currentValue = value;
//                   setState(() {});
//                   if (widget.onChange != null) {
//                     widget.onChange!(value);
//                   }
//                 });
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }
