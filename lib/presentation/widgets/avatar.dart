import 'package:cached_network_image/cached_network_image.dart';
import 'package:example_fish_fortune/core/utils/assets.dart';
import 'package:flutter/material.dart';

class Avatar extends StatefulWidget {
  final String url;
  final double height;
  final double width;
  const Avatar({
    super.key,
    required this.url,
    this.height = 48,
    this.width = 48,
  });

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.url,
      placeholder: (context, url) => SizedBox(
        height: 48,
        width: 48,
        child: Image.asset(Assets.avatar),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: 48,
        width: 48,
        child: Image.asset(Assets.avatar),
      ),
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      fit: BoxFit.cover,
      height: widget.height,
      width: widget.width,
    );
  }
}
