import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingIconPressed;
  final IconData? actionIcon;
  final VoidCallback? onActionIconPressed;

  const MyAppBar({
    super.key,
    required this.title,
    this.leadingIcon,
    this.onLeadingIconPressed,
    this.actionIcon,
    this.onActionIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      toolbarHeight: 75,
      backgroundColor: theme.appBarTheme.backgroundColor,
      title: Text(
        title,
        style: theme.textTheme.displayLarge,
      ),
      centerTitle: true,
      leading: leadingIcon != null
          ? IconButton(
              icon: Icon(
                leadingIcon,
                color: theme.iconTheme.color,
                size: 32,
              ),
              onPressed: onLeadingIconPressed ?? () {},
            )
          : null,
      actions: actionIcon != null
          ? [
              InkWell(
                onTap: onActionIconPressed ?? () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Icon(
                    actionIcon,
                    color: theme.iconTheme.color,
                    size: 32,
                  ),
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
