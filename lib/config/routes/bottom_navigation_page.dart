import 'package:example_fish_fortune/config/themes/base_color.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({
    super.key,
    required this.child,
  });

  final StatefulNavigationShell child;

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: BaseColor.black.withOpacity(0.1),
              ),
            ),
          ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            currentIndex: widget.child.currentIndex,
            onTap: (index) {
              if (index == widget.child.currentIndex) return;

              widget.child.goBranch(
                index,
                initialLocation: index == widget.child.currentIndex,
              );
              setState(() {});
            },
            items: navbarItems,
          ),
        ),
      ),
    );
  }

  static Widget activeIcon(String assetName) {
    return SizedBox.square(
      dimension: 52,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;
          const double borderWidth = 2;
          const Color borderColor = BaseColor.black;

          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: height,
                width: width - borderWidth * 2 * 2,
                decoration: const BoxDecoration(
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
                decoration: const BoxDecoration(
                  color: Color(0xff1A6546),
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
                decoration: const BoxDecoration(
                  color: Color(0xff249063),
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
              SvgPicture.asset(
                assetName,
                colorFilter: const ColorFilter.mode(
                  BaseColor.white,
                  BlendMode.srcIn,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static final navbarItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.icHome),
      activeIcon: activeIcon(Assets.icHome),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.icCollection),
      activeIcon: activeIcon(Assets.icCollection),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.icShop),
      activeIcon: activeIcon(Assets.icShop),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.icMyFishRoad),
      activeIcon: activeIcon(Assets.icMyFishRoad),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(Assets.icProfile),
      activeIcon: activeIcon(Assets.icProfile),
      label: '',
    ),
  ];
}
