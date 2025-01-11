import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarGlowWidget extends StatelessWidget {
  const AvatarGlowWidget({
    super.key,
    required this.theme,
    // required this.height,
    // required this.width,
  });

  final ThemeData theme;

  // final dynamic height;

  // final dynamic width;

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      startDelay: const Duration(microseconds: 900),
      repeat: true,
      glowRadiusFactor: 0.14,
      child: Material(
        elevation: 0.1,
        shape: const CircleBorder(),
        // color: AppColors.avatarGlowColor,
        color: theme.cardColor,
        child: Container(
          // height: height,
          // width: width,
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: AppColors.secondaryColor,
            color: theme.cardColor,
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  "https://images.unsplash.com/photo-1529946179074-87642f6204d7?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  height: 130,
                  width: 130,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/jpg/profile-placeholder.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              errorWidget: (context, url, error) => Icon(
                Icons.add,
                // color: AppColors.primaryColor,
                color: theme.iconTheme.color,
                size: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
