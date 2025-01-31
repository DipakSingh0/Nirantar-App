import 'package:nira/widgets/imports.dart';

class CustomWardListTile extends StatelessWidget {
  final String profileTitleText;
  final VoidCallback onTap;
  final String profileLeadingIconName;
  final String totalbednumber;

  const CustomWardListTile({
    super.key,
    required this.profileTitleText,
    required this.onTap,
    required this.profileLeadingIconName,
    required this.totalbednumber,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
        leading: const Icon(
          Icons.home,
          size: 25,
          color: Colors.white,
        ),
        title: Text(profileTitleText),
        titleTextStyle: GoogleFonts.montserrat(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        trailing: Text(
          "Beds - $totalbednumber",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}
