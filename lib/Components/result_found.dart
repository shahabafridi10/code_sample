import 'package:flutter/material.dart';
import '../Utils/app_constants.dart';
import '../Utils/app_text_themes.dart';

class ResultCountTextWidget extends StatelessWidget {
  final int count;

  const ResultCountTextWidget({
    super.key,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          '$count ${AppConstants.result_found}',
          style: AppTextThemes.search_found_theme,
        ),
      ),
    );
  }
}
