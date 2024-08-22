import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isShowBackIcon;
  final String? backIconText;
  final List<Widget>? suffixWidget;
  final void Function()? onTapBack;
  const CustomAppBar({
    super.key,
    this.isShowBackIcon = true,
    this.suffixWidget,
    this.backIconText,
    this.onTapBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(Constant.APPBAR_HEIGHT);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, preferredSize.height),
      child: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: preferredSize.height,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: <Widget>[
              if (isShowBackIcon)
                GestureDetector(
                  onTap: () {
                    _onGotoBack(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox.square(
                        dimension: 24,
                        child: SvgPicture.asset(Assets.icChevronLeft),
                      ),
                      const SizedBox(width: 8),
                      Text(backIconText ?? "Back").gs16m().greyColor(),
                    ],
                  ),
                ),
              if (suffixWidget != null) ...suffixWidget!
            ],
          ),
        ),
      ),
    );
  }

  void _onGotoBack(BuildContext context) {
    if (onTapBack != null) {
      onTapBack!();
      return;
    }

    context.pop();
  }
}
