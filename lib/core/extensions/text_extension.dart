import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:flutter/material.dart';

/// how to use Text("lorem ipsum").pjs24b()
extension TextExtension on Text {
  Text heading4() => copyWith(
        style: const TextStyle(
          fontFamily: Constant.CLASH_DISPLAY,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          height: 1.1,
        ),
      );

  Text title18() => copyWith(
        style: const TextStyle(
          fontFamily: Constant.CLASH_DISPLAY,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.1,
        ),
      );

  Text title16() => copyWith(
        style: const TextStyle(
          fontFamily: Constant.CLASH_DISPLAY,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          height: 1.1,
        ),
      );

  Text title14() => copyWith(
        style: const TextStyle(
          fontFamily: Constant.CLASH_DISPLAY,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.1,
        ),
      );

  Text cd20b() => copyWith(
        style: const TextStyle(
          fontFamily: Constant.CLASH_DISPLAY,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      );

  Text cd16b() => copyWith(
        style: const TextStyle(
          fontFamily: Constant.CLASH_DISPLAY,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      );

  Text cd14b() => copyWith(
        style: const TextStyle(
          fontFamily: Constant.CLASH_DISPLAY,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      );

  Text gs16m() => copyWith(
        style: const TextStyle(
          fontFamily: Constant.GENERAL_SANS,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      );

  Text gs14m() => copyWith(
        style: const TextStyle(
          fontFamily: Constant.GENERAL_SANS,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      );

  Text whiteColor() => copyWith(style: const TextStyle(color: BaseColor.white));
  Text blackColor() => copyWith(style: const TextStyle(color: BaseColor.black));
  Text greyColor() =>
      copyWith(style: const TextStyle(color: Color(0xff64748B)));

  Text lineHeight24() => copyWith(style: const TextStyle(height: 1.5));

  Text copyWith({
    Key? key,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection = TextDirection.ltr,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor,
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextStyle? style,
  }) {
    return Text(
      data ?? '',
      key: key ?? this.key,
      strutStyle: strutStyle ?? this.strutStyle,
      textAlign: textAlign ?? this.textAlign,
      textDirection: textDirection ?? this.textDirection,
      locale: locale ?? this.locale,
      softWrap: softWrap ?? this.softWrap,
      overflow: overflow ?? this.overflow,
      textScaleFactor: textScaleFactor ?? this.textScaleFactor,
      maxLines: maxLines ?? this.maxLines,
      semanticsLabel: semanticsLabel ?? this.semanticsLabel,
      textWidthBasis: textWidthBasis ?? this.textWidthBasis,
      style: style != null ? this.style?.merge(style) ?? style : this.style,
    );
  }
}
