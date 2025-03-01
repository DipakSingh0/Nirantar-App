import 'package:flutter/material.dart';

class CustomNavigationButton extends StatelessWidget {
  final IconData icon;
  final String pageName;
  final Widget targetPage;

  const CustomNavigationButton({
    super.key,
    required this.icon,
    required this.pageName,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        // Navigate to the target page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Container(
        width: 100, 
        height: 100, 
        decoration: BoxDecoration(
          color: theme.cardColor, // Use theme's card color
          borderRadius: BorderRadius.circular(12), // Radius of 12
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40, 
              color: theme.iconTheme.color, 
            ),
            const SizedBox(height: 8), 
            Text(
              pageName,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
