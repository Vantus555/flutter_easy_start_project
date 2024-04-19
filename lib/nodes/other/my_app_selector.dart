import 'package:flutter/material.dart';

class MyAppSelector<T> extends StatefulWidget {
  final Map<T, Widget> items;
  final String labelText;
  final T? initializeValue;
  final Function(T value)? onChanged;
  final EdgeInsetsGeometry padding;

  const MyAppSelector({
    super.key,
    required this.items,
    required this.labelText,
    this.initializeValue,
    this.onChanged,
    this.padding = const EdgeInsets.all(10),
  });

  @override
  State<StatefulWidget> createState() => _MyAppSelectorState<T>();
}

class _MyAppSelectorState<T> extends State<MyAppSelector<T>> {
  List<DropdownMenuItem<T>> _items = [];
  T? _value;

  @override
  @protected
  void initState() {
    _value ??= widget.initializeValue;
    if (_items.isEmpty) {
      _items = widget.items.entries
          .map(
            (e) => DropdownMenuItem<T>(
              value: e.key,
              child: e.value,
            ),
          )
          .toList();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: DropdownButtonFormField(
        isExpanded: true,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
          contentPadding: const EdgeInsets.all(13),
        ),
        value: _value,
        items: _items,
        onChanged: (value) {
          _value = value;
          if (widget.onChanged != null && value != null) {
            widget.onChanged!(value);
          }
          setState(() {});
        },
      ),
    );
  }
}
