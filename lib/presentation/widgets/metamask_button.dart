import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class MetamaskButton extends StatelessWidget {
  final void Function() onTap;
  const MetamaskButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: double.infinity,
      child: MainButton(
        bgColor1: BaseColor.white,
        bgColor2: BaseColor.white,
        borderColor: const Color(0xffAAAAAA),
        borderWidth: 2,
        customText: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: 28,
              child: Image.asset(Assets.metamask),
            ),
            const SizedBox(width: 8),
            const Text("METAMASK").cd16b().blackColor(),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
