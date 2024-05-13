// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fesp_text.dart';

// **************************************************************************
// FespNodeBuildersGenerator
// **************************************************************************

class $FespTextBuilderData {
  final String text;

  const $FespTextBuilderData({
    required this.text,
  });
  // ignore: unused_element
  $FespTextBuilderData copyWith({
    String? text,
  }) {
    return $FespTextBuilderData(
      text: text ?? this.text,
    );
  }
}

class $FespSelectableTextBuilderData {
  final String text;

  const $FespSelectableTextBuilderData({
    required this.text,
  });
  // ignore: unused_element
  $FespSelectableTextBuilderData copyWith({
    String? text,
  }) {
    return $FespSelectableTextBuilderData(
      text: text ?? this.text,
    );
  }
}

class _$FespTextData {
  final Text Function(
    BuildContext p0,
    $FespTextBuilderData p1,
  )? fespBuilder0;
  final SelectableText Function(
    BuildContext p0,
    $FespSelectableTextBuilderData p1,
  )? fespBuilder1;

  const _$FespTextData({
    this.fespBuilder0,
    this.fespBuilder1,
  });
  Text _$fespBuilder0(
    BuildContext p0,
    $FespTextBuilderData p1,
  ) {
    return fespBuilder0 != null
        ? fespBuilder0!(
            p0,
            p1,
          )
        : Text(
            p1.text,
          );
  }

  SelectableText _$fespBuilder1(
    BuildContext p0,
    $FespSelectableTextBuilderData p1,
  ) {
    return fespBuilder1 != null
        ? fespBuilder1!(
            p0,
            p1,
          )
        : SelectableText(
            p1.text,
          );
  }
}

extension on FespTextData {
  // ignore: unused_element
  FespTextData copyWith({
    final Text Function(
      BuildContext p0,
      $FespTextBuilderData p1,
    )? fespBuilder0,
    final SelectableText Function(
      BuildContext p0,
      $FespSelectableTextBuilderData p1,
    )? fespBuilder1,
    bool? isSelectable,
    double? padding,
  }) {
    return FespTextData(
      fespBuilder0: fespBuilder0 ?? this.fespBuilder0,
      fespBuilder1: fespBuilder1 ?? this.fespBuilder1,
      isSelectable: isSelectable ?? this.isSelectable,
      padding: padding ?? this.padding,
    );
  }
}
