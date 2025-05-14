import 'package:evencir_task/Components/custom_sizeBox.dart';
import 'package:evencir_task/Utils/app_assets_paths.dart';
import 'package:evencir_task/Utils/app_colors.dart';
import 'package:evencir_task/Utils/app_constants.dart';
import 'package:evencir_task/Views/Home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utils/app_text_themes.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ), // Replace with your screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AssetPaths.splash, fit: BoxFit.fill),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.2),
                    AppColors.kGridentColor,
                  ],
                ),
              ),
            ),
          ),

          // Content
          Positioned.fill(
            child: Column(
              children: <Widget>[
                CustomSizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.09,
                ),

                Text(AppConstants.myStore, style: AppTextThemes.largeDisplay_theme),
                Spacer(),
                Text(
                  AppConstants.valkommen,
                  style: AppTextThemes.display_medium_theme,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 15,
                  ),
                  child: Text(
                    AppConstants.splash_desc,
                    style: AppTextThemes.normal_desc_theme,
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomSizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
