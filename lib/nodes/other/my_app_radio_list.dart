import 'package:flutter/material.dart';
import 'package:nedoctor_pro/project/app_consts.dart';

class MyAppRadioList<T> extends StatefulWidget {
  final Map<T, Widget> values;
  final T? currentValue;
  final Function(T?)? onChanged;
  final Widget? subtitle;

  const MyAppRadioList({
    super.key,
    required this.values,
    required this.onChanged,
    this.currentValue,
    this.subtitle,
  });

  @override
  State<MyAppRadioList<T>> createState() => _MyAppRadioListState<T>();
}

class _MyAppRadioListState<T> extends State<MyAppRadioList<T>> {
  T? _currentValue;

  @override
  void initState() {
    _currentValue = widget.currentValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    widget.values.forEach((key, value) {
      children.add(
        RadioListTile<T>(
          value: key,
          groupValue: _currentValue,
          onChanged: (value) {
            _currentValue = value;
            setState(() {});
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          title: value,
          subtitle: widget.subtitle,
          selectedTileColor: AppConsts.DRAWER_HEADER_DEFAULT_COLOR(context),
          selected: value == _currentValue,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppConsts.TILE_DEFAULT_BORDER_RADIUS,
            ),
          ),
        ),
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...children,
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: TextButton(
            onPressed: () {
              _currentValue = null;
              setState(() {});
              if (widget.onChanged != null) {
                widget.onChanged!(null);
              }
            },
            child: const Text(AppConsts.RESET_TITLE),
          ),
        ),
      ],
    );
  }
}
