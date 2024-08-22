import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final void Function() onTap;
  final String textButton;
  final Color? bgColor1;
  final Color? bgColor2;
  final Color borderColor;
  final double borderWidth;
  final Color? textColor;
  final Widget? customText;
  const MainButton({
    super.key,
    this.textButton = "",
    required this.onTap,
    this.bgColor1,
    this.bgColor2,
    this.borderColor = const Color(0xff1A170B),
    this.borderWidth = 4,
    this.textColor,
    this.customText,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final height = constraints.maxHeight;
        final width = constraints.maxWidth;

        return GestureDetector(
          onTap: onTap,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: height,
                width: width - borderWidth * 2 * 2,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: borderWidth,
                      color: borderColor,
                    ),
                    bottom: BorderSide(
                      width: borderWidth,
                      color: borderColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: height - borderWidth * 2,
                width: width - borderWidth * 2,
                decoration: BoxDecoration(
                  color: bgColor2 ?? const Color(0xff547484),
                  border: Border(
                    left: BorderSide(
                      width: borderWidth,
                      color: borderColor,
                    ),
                    right: BorderSide(
                      width: borderWidth,
                      color: borderColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: height - borderWidth * 2 * 2,
                width: width,
                decoration: BoxDecoration(
                  color: bgColor1 ?? BaseColor.primary,
                  border: Border(
                    left: BorderSide(
                      width: borderWidth,
                      color: borderColor,
                    ),
                    right: BorderSide(
                      width: borderWidth,
                      color: borderColor,
                    ),
                  ),
                ),
              ),
              customText ??
                  Text(
                    textButton,
                    style: TextStyle(color: textColor ?? BaseColor.white),
                  ).title16(),
            ],
          ),
        );
      },
    );
  }
}
