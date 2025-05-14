import 'package:evencir_task/Models/product_api_model.dart';
import 'package:evencir_task/Views/Favourites/favourite_screen.dart';
import 'package:flutter/cupertino.dart';

import '../Views/Account/account_screen.dart';
import '../Views/Categories/categories_screen.dart';
import '../Views/Product/product_screen.dart';


class HomeProvider extends ChangeNotifier{
  int selectedIndex = 0;


  final List<Widget> screens = [
    ProductScreen(),
    CategoriesScreen(),
    FavouriteScreen(),
    AccountScreen(),
  ];

  void onItemTapped(int index) {

      selectedIndex = index;
      notifyListeners();

  }

  ProductApiModel? productApiModel;




}