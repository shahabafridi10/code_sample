class FavouriteProductModel{
  var id ;
  var name;
  var rating;
  var price;
  var image;

  FavouriteProductModel({required this.id , required this.name, required this.rating , required this.price , required this.image});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FavouriteProductModel &&
              runtimeType == other.runtimeType &&
              id == other.id;

}

