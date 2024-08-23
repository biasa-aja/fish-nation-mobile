import 'package:example_fish_fortune/config/routes/navigation.dart';
import 'package:example_fish_fortune/config/routes/route_path.dart';
import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/core/utils/constant.dart';
import 'package:example_fish_fortune/core/utils/helper.dart';
import 'package:example_fish_fortune/presentation/pages/home/cubit/recent_list_cubit.dart';
import 'package:example_fish_fortune/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class FishingTopbar extends StatefulWidget {
  const FishingTopbar({super.key});

  @override
  State<FishingTopbar> createState() => _FishingTopbarState();
}

class _FishingTopbarState extends State<FishingTopbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: Helper.deviceWidth(context),
      height: 180,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            BaseColor.black.withOpacity(0.6),
            BaseColor.black.withOpacity(0.0),
          ],
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _onTapExit,
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        Assets.icChevronLeft,
                        colorFilter: const ColorFilter.mode(
                          BaseColor.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text("Exit").gs16m().whiteColor(),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 28,
                      child: Image.asset(Assets.energy2),
                    ),
                    const SizedBox(width: 12),
                    const Text("5").title18().whiteColor(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapExit() {
    context.pop();
    context.pop(Constant.RELOAD);
  }
}
