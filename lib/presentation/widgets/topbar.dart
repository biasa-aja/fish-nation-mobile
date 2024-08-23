import 'package:example_fish_fortune/core/extensions/text_extension.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:example_fish_fortune/presentation/provider/profile_provider.dart';
import 'package:example_fish_fortune/presentation/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Topbar extends StatefulWidget {
  const Topbar({super.key});

  @override
  State<Topbar> createState() => _TopbarState();
}

class _TopbarState extends State<Topbar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Avatar(url: ""),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.profile?.username ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ).cd16b().blackColor(),
                          Text("LVL ${provider.profile?.level ?? 0}")
                              .gs14m()
                              .greyColor(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                height: 28,
                child: Image.asset(Assets.coin),
              ),
              const SizedBox(width: 8),
              const Text("500").title18(),
              const SizedBox(width: 24),
              SizedBox(
                height: 28,
                child: Image.asset(Assets.energy),
              ),
              const SizedBox(width: 8),
              Text("${provider.profile?.energy ?? 0}").title18(),
            ],
          ),
        );
      },
    );
  }
}
