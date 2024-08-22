import 'package:example_fish_fortune/config/routes/route_path.dart';
import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/presentation/pages/home/widget/challenge_list_tile.dart';
import 'package:example_fish_fortune/presentation/pages/home/widget/recent_list_tile.dart';
import 'package:example_fish_fortune/presentation/widgets/avatar.dart';
import 'package:example_fish_fortune/presentation/widgets/main_button.dart';
import 'package:example_fish_fortune/presentation/widgets/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Topbar(),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildStartButton(),
                    const SizedBox(height: 24),
                    _buildRecent(),
                    const SizedBox(height: 24),
                    _buildChallenges(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton() {
    return SizedBox(
      height: 82,
      width: double.infinity,
      child: MainButton(
        borderWidth: 2,
        onTap: _onStartFishing,
        customText: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Image.asset(
                Assets.rod,
                height: 48,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("START FISHING").title18().whiteColor(),
                    const SizedBox(height: 4),
                    const Text("Dive into the waters and see")
                        .gs14m()
                        .whiteColor(),
                  ],
                ),
              ),
              SvgPicture.asset(Assets.icChevronRight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecent() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: const Text("RECENT CATCHES").title16().blackColor(),
            ),
            Row(
              children: [
                const Text("See All"),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  Assets.icChevronRight,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff587888),
                    BlendMode.srcIn,
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: RecentListTile(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildChallenges() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: const Text("DAILY CHALLENGES").title16().blackColor(),
            ),
            Row(
              children: [
                const Text("See All"),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  Assets.icChevronRight,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff587888),
                    BlendMode.srcIn,
                  ),
                )
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: ChallengeListTile(),
            );
          },
        ),
      ],
    );
  }

  void _onStartFishing() {
    context.push(RoutePath.fishing);
  }
}
