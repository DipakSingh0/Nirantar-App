import 'package:nira/widgets/imports.dart';

class CustomProfileListTile extends StatelessWidget {
  final String profileTitleText;
  final VoidCallback onTap;
  final String profileLeadingIconName;

  const CustomProfileListTile({
    super.key,
    required this.profileTitleText,
    required this.onTap,
    required this.profileLeadingIconName,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      contentPadding:
          const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
      // Adjust vertical padding here
      leading: SvgPicture.asset(
        "lib/assets/svg/$profileLeadingIconName.svg",
        height: 28,
        width: 28,
        fit: BoxFit.cover,
        // ignore: deprecated_member_use
        color: theme.iconTheme.color,
      ),
      title: Text(profileTitleText),
      titleTextStyle: theme.textTheme.headlineMedium,
      trailing: Icon(
        size: 26,
        Icons.arrow_forward_rounded,
        color: theme.iconTheme.color,
      ),
    );
  }
}
