import 'package:flutter/material.dart';
import 'package:flutter_easy_start_project/nodes/fesp_multi_scroll.dart';

abstract class FespDialogs {
  static Future<bool?> confirm({
    required BuildContext context,
    required String title,
    final String yes = 'Yes',
    final String no = 'No',
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(yes),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(no),
          ),
        ],
      ),
    );
  }

  static Future<bool?> window({
    required BuildContext context,
    required String title,
    required Widget child,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(title)),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        content: FespMultiScroll(
          horizontal: false,
          child: child,
        ),
      ),
    );
  }
}
