import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTextThemes {
  static final TextStyle largeDisplay_theme = GoogleFonts.playfairDisplay(
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w400,
    fontSize: 50,
  );
  static final TextStyle profileDisplay_theme = GoogleFonts.playfairDisplay(
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w400,
    fontSize: 30,
  );
  static final TextStyle appBar_largeDisplay_theme = GoogleFonts.playfairDisplay(
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w600,
    fontSize: 25,
  );

  static final TextStyle display_medium_theme = GoogleFonts.poppins(
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  static final TextStyle post_title_theme = GoogleFonts.poppins(
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );
  static final TextStyle black_post_title_theme = GoogleFonts.poppins(
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );
  static final TextStyle post_rating_theme = GoogleFonts.poppins(
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  static final TextStyle normal_desc_theme = GoogleFonts.poppins(
    color: AppColors.kWhiteColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  static final TextStyle black_normal_desc_theme = GoogleFonts.poppins(
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  static final TextStyle search_found_theme = GoogleFonts.poppins(
    color: AppColors.kGreyColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,

  );

  static final TextStyle post_hint_theme = GoogleFonts.poppins(
    color: AppColors.kBlackColor,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

}
