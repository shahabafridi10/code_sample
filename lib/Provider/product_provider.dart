import 'package:evencir_task/Models/product_api_model.dart';
import 'package:flutter/cupertino.dart';

import '../Service/api_services.dart';

class ProductProvider extends ChangeNotifier {
  ProductApiModel? productData;
  bool isLoading = false;
  List<Products> filteredProducts = [];

  Future fetchProducts() async {
    isLoading = true;

    try {
      final response = await ApiServices.getProducts();
      productData = ProductApiModel.fromJson(response);
      filteredProducts = productData?.products ?? [];
    } catch (e) {
      print('Error fetching products: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  void filterProducts(String search_query) {
    if (search_query.isEmpty) {
      filteredProducts = productData?.products ?? [];
    } else {
      filteredProducts = productData?.products
          ?.where((p) => p.title.toLowerCase().contains(search_query.toLowerCase()))
          .toList() ??
          [];
    }
    notifyListeners();
  }
}
