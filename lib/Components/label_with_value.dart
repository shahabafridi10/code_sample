
import 'package:flutter/material.dart';
import 'package:evencir_task/Utils/app_text_themes.dart';

class LabelWithValue extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? valueWidget;

  const LabelWithValue({
    Key? key,
    required this.label,
    this.value,
    this.valueWidget,
  }) : assert(value != null || valueWidget != null, 'Either value or valueWidget must be provided'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$label:',
            style: AppTextThemes.post_title_theme,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: valueWidget ??
                Text(
                  value!,
                  style: AppTextThemes.black_normal_desc_theme,
                ),
          ),
        ],
      ),
    );
  }
}
