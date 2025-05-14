import 'package:evencir_task/Components/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Utils/app_colors.dart';
import '../Utils/app_text_themes.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProductCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final onTap;

  const ProductCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.transparent),
              left: BorderSide(color: AppColors.kCustomGreyColor),
              right: BorderSide(color: AppColors.kCustomGreyColor),
              bottom: BorderSide(color: AppColors.kCustomGreyColor),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fill,
                  height: 140,
                  width: double.infinity,
                ),
               //
              ),

              // Title & Price Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width/2,
                      child: Text(title, style: AppTextThemes.post_title_theme, overflow: TextOverflow.ellipsis,)),
                  Text('\$${price.toStringAsFixed(0)}', style: AppTextThemes.post_title_theme),
                ],
              ),

              // Rating Row
              Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(double.parse(rating.toStringAsFixed(1)).toString() , style: AppTextThemes.post_rating_theme),
                   RatingBarWidget(rating: rating),
                  ],
                ),
              ),


              // Brand & Category
              Text('By $brand', style: AppTextThemes.search_found_theme),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20.0),
                child: Text(category, style: AppTextThemes.post_hint_theme),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
