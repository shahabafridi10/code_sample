import 'package:flutter/material.dart';
import 'package:evencir_task/Utils/app_text_themes.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$title:',
      style: AppTextThemes.post_title_theme,
    );
  }
}
