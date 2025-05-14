import 'package:evencir_task/Provider/home_provider.dart';
import 'package:evencir_task/Utils/app_colors.dart';
import 'package:evencir_task/Utils/app_constants.dart';
import 'package:evencir_task/Views/Account/account_screen.dart';
import 'package:evencir_task/Views/Categories/categories_screen.dart';
import 'package:evencir_task/Views/Product/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Utils/app_assets_paths.dart';
import '../Favourites/favourite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {

    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider provider, Widget? child) {
        return Scaffold(
          body:
          SafeArea(child: provider.screens[provider.selectedIndex]),
          bottomNavigationBar: BottomNavigationBar(
             currentIndex: provider.selectedIndex,
            onTap: provider.onItemTapped,
            elevation: 0,
            showUnselectedLabels: true,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(fontSize: 13),
            unselectedLabelStyle: const TextStyle(fontSize: 13),
            type: BottomNavigationBarType.fixed,
            items:   [
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPaths.product,
                  width: 20,
                  height: 20,
                  color: provider.selectedIndex == 0 ? Colors.grey : Colors.white,
                ),
                label: AppConstants.products,
              ),BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPaths.category,
                  width: 20,
                  height: 20,
                  color: provider.selectedIndex == 1 ? Colors.grey : Colors.white,
                ),
                label: AppConstants.categories,

              ),BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPaths.white_favor,
                  width: 20,
                  height: 20,
                  color: provider.selectedIndex == 2 ? Colors.grey : Colors.white,
                ),
                label: AppConstants.favourites,

              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  AssetPaths.person,
                  width: 20,
                  height: 20,
                  color: provider.selectedIndex == 3 ? Colors.grey : Colors.white,
                ),
                label: AppConstants.person,

              ),
            ],
          ),

        );
      },

    );
  }
}

