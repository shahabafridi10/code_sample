import 'package:flutter/material.dart';

import '../Utils/app_text_themes.dart';

class ProfileOptionTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

    ProfileOptionTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Image.asset(icon, height: 22,width: 22, color: Colors.black),
            const SizedBox(width: 16),
            Text(title, style: AppTextThemes.black_normal_desc_theme),
          ],
        ),
      ),
    );
  }
}
