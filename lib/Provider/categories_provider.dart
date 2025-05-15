import 'package:flutter/cupertino.dart';
import '../Service/api_services.dart';

import '../Models/categories_api_model.dart';

class CategoriesProvider extends ChangeNotifier {
  List<CategoriesApiModel>? categoriesData;
  List<CategoriesApiModel> filteredCategories = [];
  bool isLoading = false;

  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners();
    try {
      categoriesData = await ApiServices.getCategories();
      filteredCategories =
          categoriesData ?? [];
      print("category data $categoriesData");
    } catch (e) {
      print('Categories error: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  void filterCategories(String query) {
    if (query.isEmpty) {
      filteredCategories =
          categoriesData ?? [];
    } else {
      filteredCategories =
          (categoriesData ?? [])
              .where(
                (category) =>
                    category.name!.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
    }
    notifyListeners();
  }
}
