import 'package:flutter/material.dart';
import 'package:evencir_task/Utils/app_text_themes.dart';
import '../Utils/app_assets_paths.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String searchName;
  final int navigator;

  CustomAppBar({
    Key? key,
    required this.searchName,
    required this.navigator,
  })  : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        searchName,
        style: AppTextThemes.appBar_largeDisplay_theme,
      ),
      leading: navigator == 0
          ? null
          : IconButton(
        icon: Image.asset(
          AssetPaths.arrowBack,
          height: 20,
          width: 20,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
