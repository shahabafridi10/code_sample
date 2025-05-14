import 'package:flutter/cupertino.dart';

import '../Models/detail_product_api_model.dart';
import '../Service/api_services.dart';

class DetailProductProvider extends ChangeNotifier{

  DetaiProductApiModel? detailProductData;
  bool isLoading = false;
  List  favouriteList=[];

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

  addToFavorList(int id){
    if(favouriteList.contains(id)){
      favouriteList.remove(id);
      notifyListeners();
    }else{
      favouriteList.add(id);
      notifyListeners();
    }



  }

  removeFav(int id) {
    favouriteList.remove(id);
    favouriteList.removeAt(id);
    notifyListeners();
  }
}