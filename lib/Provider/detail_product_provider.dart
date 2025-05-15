import 'package:evencir_task/Models/favourite_product_model.dart';
import 'package:flutter/cupertino.dart';

import '../Models/detail_product_api_model.dart';
import '../Service/api_services.dart';

class DetailProductProvider extends ChangeNotifier{

  DetaiProductApiModel? detailProductData;
  bool isLoading = false;
  List<FavouriteProductModel>  favouriteList=[];
  List<FavouriteProductModel> filteredFavouriteList = [];
  FavouriteProvider() {
    filteredFavouriteList = favouriteList; // Initial state
  }

  Future fetchDetailProductData({required var id}) async {
    isLoading = true;

    try {
      final response = await ApiServices.getDetailProductProvider(id: id);
      detailProductData = DetaiProductApiModel.fromJson(response);
    } catch (e) {
      print('Error fetching products: $e');
    }

    isLoading = false;
    notifyListeners();
  }

    addToFavorList({
    required int id,
    required String name,
    required double rating,
    required double price,
    required String image,
  }) {
    final index = favouriteList.indexWhere((item) => item.id == id);

    if (index != -1) {
      favouriteList.removeAt(index);
    } else {
      favouriteList.add(FavouriteProductModel(
        id: id,
        name: name,
        rating: rating,
        price: price,
        image: image,
      ));
      print('favourite List : ${favouriteList.length}');
    }
    filteredFavouriteList = List.from(favouriteList);
    notifyListeners();
  }


  void removeFav(int id) {
    favouriteList.removeWhere((item) => item.id == id);
    filteredFavouriteList.removeWhere((item) => item.id == id);
    notifyListeners();
  }


  void filterFavourites(String query) {
    if (query.isEmpty) {
      filteredFavouriteList = List.from(favouriteList);
    } else {
      filteredFavouriteList = favouriteList
          .where((item) =>
          item.name.toLowerCase().contains(query.trim().toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}