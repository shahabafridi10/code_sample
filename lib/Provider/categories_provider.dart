import 'package:evencir_task/Models/product_api_model.dart';
import 'package:flutter/cupertino.dart';
import '../Service/api_services.dart';

import '../Models/categories_api_model.dart';

// class CategoriesProvider extends ChangeNotifier {
//   List<CategoriesApiModel>? categoriesData;
//   List<CategoriesApiModel> filteredCategories = [];
//   bool isLoading = false;
//   // List<Products> allProducts = [];
//   // List<Products> filteredProducts = [];
//
//   Future<void> fetchCategories() async {
//     isLoading = true;
//
//     try {
//       categoriesData = await ApiServices.getCategories();
//       print("category data $categoriesData");
//
//     } catch (e) {
//       print('Categories error: $e');
//     }
//
//     isLoading = false;
//     notifyListeners();
//   }
//
//
//
//
// }
import 'package:flutter/cupertino.dart';

class CategoriesProvider extends ChangeNotifier {
  List<CategoriesApiModel>? categoriesData;
  List<CategoriesApiModel> filteredCategories = [];
  bool isLoading = false;

  Future<void> fetchCategories() async {
    isLoading = true;
    notifyListeners(); // Notify listeners to update loading state

    try {
      categoriesData = await ApiServices.getCategories();
      filteredCategories = categoriesData ?? []; // Initialize filteredCategories
      print("category data $categoriesData");
    } catch (e) {
      print('Categories error: $e');
    }

    isLoading = false;
    notifyListeners(); // Notify listeners after fetching data
  }

  void filterCategories(String query) {
    if (query.isEmpty) {
      filteredCategories = categoriesData ?? []; // If query is empty, show all categories
    } else {
      filteredCategories = (categoriesData ?? [])
          .where((category) =>
          category.name!.toLowerCase().contains(query.toLowerCase()))
          .toList(); // Filter categories by name
    }
    notifyListeners(); // Notify listeners after filtering
  }
}
