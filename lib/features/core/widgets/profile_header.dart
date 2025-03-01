import 'package:nira/imports.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Stack(
              children: [
                AvatarGlowWidget(
                  theme: theme,
                ),
                Positioned(
                  right: 1,
                  bottom: 1,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: theme.iconTheme.color,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Nirantar Hospital",
              textAlign: TextAlign.center,
              style: theme.textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
