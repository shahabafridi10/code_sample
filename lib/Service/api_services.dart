import 'dart:async';
import 'dart:convert';
import 'package:evencir_task/Models/categories_api_model.dart';
import 'package:http/http.dart' as http;
import '../Models/product_api_model.dart';
import 'api_urls.dart';

class ApiServices {

  static Future getProducts() async {
    try{
      var request = http.Request('GET', Uri.parse(Api_Url.PRODUCTS));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var getResponce=await response.stream.bytesToString();
        var decoded=jsonDecode(getResponce);
        // print('decoded product Api :: $decoded');

        return decoded;
      }
      else {
        print('else');
        print(response.reasonPhrase);
      }
    }catch(e){
      print('product catch $e');
    }

  }

  static Future<List<CategoriesApiModel>> getCategories() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products/categories'));

      if (response.statusCode == 200) {
        final List<dynamic> decoded = json.decode(response.body);
        return decoded.map((item) => CategoriesApiModel.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error in ApiService.fetchCategories: $e');
      rethrow;
    }
  }
  static Future getCategoriesByProducts() async {
    try{
      var request = http.Request('GET', Uri.parse(Api_Url.PRODUCTS));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var getResponce=await response.stream.bytesToString();
        var decoded=jsonDecode(getResponce);
        // print('decoded product Api :: $decoded');

        return decoded;
      }
      else {
        print('else');
        print(response.reasonPhrase);
      }
    }catch(e){
      print('product catch $e');
    }

  }

  static Future getDetailProductProvider({required var id}) async {
    try{
      var request = http.Request('GET', Uri.parse(Api_Url.DETAIL_PRODUCT+id));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var getResponce=await response.stream.bytesToString();
        var decoded=jsonDecode(getResponce);
         // print('decoded DEtail  product Api :: $decoded');

        return decoded;
      }
      else {
        print('else');
        print(response.reasonPhrase);
      }
    }catch(e){
      print('Detail product catch $e');
    }

  }


}