class Api_Url {
//========================================================================
  //BASE URL
//========================================================================

  static const String BASE_URL = "https://dummyjson.com";

  //========================================================================
  //Api points 
//========================================================================

  static const String PRODUCT_Url = "/products?limit100";
  static const String CATEGORIES_Url = "/products/categories";
  static const String CATEGORIES_BY_PRODUCT_Url = "/products/categories?";
  static const String DETAIL_PRODUCT_Url = "/products/";

//========================================================================
  //end points
//========================================================================

  static const String PRODUCTS = "$BASE_URL$PRODUCT_Url";
  static const String CATEGORIES = "$BASE_URL$CATEGORIES_Url";
  static const String CATEGORIES_BY_PRODUCT = "$BASE_URL$CATEGORIES_BY_PRODUCT_Url";
  static const String DETAIL_PRODUCT = "$BASE_URL$DETAIL_PRODUCT_Url";
  // static const String REGISTER = "$BASE_URL$Reg_Url";
}