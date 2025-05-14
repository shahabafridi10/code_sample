import 'package:flutter/material.dart';

import '../Utils/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: SizedBox(


        child: CircularProgressIndicator(
          color: AppColors.kBlackColor,   // Black color
          strokeWidth: 1.0,      // Thickness
        ),
      ),
    );
  }
}
