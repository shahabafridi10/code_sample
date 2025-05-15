import 'package:evencir_task/Components/rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../Utils/app_assets_paths.dart';
import '../Utils/app_colors.dart';
import '../Utils/app_text_themes.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FavorPostCardWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final String brand;
  final String category;
  final onTap;
  final onTapDetail;

  const FavorPostCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.brand,
    required this.category,
    required this.onTap,
    required this.onTapDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: onTapDetail,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0),
          ),
          child: Container(
            // padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),

                  child: CircleAvatar(child: Image.network(imageUrl), radius: 40),
                  //
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image

                    // Title & Price Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2,
                          child: Text(
                            title,
                            style: AppTextThemes.post_title_theme,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    // Rating Row
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            double.parse(rating.toStringAsFixed(1)).toString(),
                            style: AppTextThemes.post_rating_theme,
                          ),

                          RatingBarWidget(rating: rating),
                        ],
                      ),
                    ),

                    Text(
                      '\$${price.toStringAsFixed(0)}',
                      style: AppTextThemes.post_title_theme,
                    ),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: InkWell(
                    onTap: onTap,
                    child: Image.asset(
                      AssetPaths.redFavor,
                      height: 25,
                      width: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
