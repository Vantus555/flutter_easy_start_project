import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_start_project/nodes/containers/fesp_container.dart';
import 'package:flutter_easy_start_project/nodes/fesp_multi_scroll.dart';
import 'package:flutter_easy_start_project/nodes/forms/fesp_text.dart';
import 'package:flutter_easy_start_project/themes/fesp_themes_consts.dart';
import 'package:flutter_easy_start_project/view_models/fesp_value_change_provider.dart';
import 'package:provider/provider.dart';

class FespCode extends StatelessWidget {
  final String text;
  const FespCode({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FespContainer(
      data: FespContainerData(
        padding: 10,
        fespBuilder0: (p0, p1) {
          return SizedBox(
            width: p1.width,
            height: p1.height,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(SLIDE_PANEL_BORDER_RADIUS),
                ),
                color: FESP_ACTIVE_COLOR(p0),
              ),
              child: Stack(
                children: [
                  FespMultiScroll(
                    vertical: false,
                    child: p1.child,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: _CopyCode(text: text),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      child: FespText(text: text),
    );
  }
}

// ignore: camel_case_types
typedef _copyProvider = FespValueChangeProvider<bool>;

class _CopyCode extends StatelessWidget {
  final String text;
  const _CopyCode({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _copyProvider(value: false),
      builder: (context, child) {
        final provider = context.watch<_copyProvider>();
        final data = provider.getValue();

        return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Icon(data == false ? Icons.copy : Icons.done),
          ),
          onTap: () async {
            if (data == true) return;
            await Clipboard.setData(ClipboardData(text: text));
            Timer(
              const Duration(seconds: 1),
              () {
                provider.setValue(false);
              },
            );
            provider.setValue(!data);
          },
        );
      },
    );
  }
}
