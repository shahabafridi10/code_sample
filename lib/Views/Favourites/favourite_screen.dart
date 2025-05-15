import 'package:evencir_task/Components/custom_appbar.dart';
import 'package:evencir_task/Components/custom_loader.dart';
import 'package:evencir_task/Components/favor_post_card.dart';
import 'package:evencir_task/Provider/detail_product_provider.dart';
import 'package:evencir_task/Service/api_services.dart';
import 'package:evencir_task/Utils/app_constants.dart';
import 'package:evencir_task/Views/DetailProduct/detail_product_screen.dart';
import 'package:flutter/material.dart';
import '../../Components/post_card.dart';
import '../../Components/result_found.dart';
import '../../Components/search_bar.dart';
import '../../Provider/product_provider.dart';
import '../../Utils/app_colors.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,

      appBar: CustomAppBar(searchName: AppConstants.favourites, navigator: 0),
      body: Consumer<DetailProductProvider>(
        builder: (
          BuildContext context,
          DetailProductProvider provider,
          Widget? child,
        ) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SearchBarComponent(
                  onChanged: (query) {
                    provider.filterFavourites(query);
                  },
                ),

                provider.filteredFavouriteList.length == provider.favouriteList.length ? SizedBox() : ResultCountTextWidget(count: provider.filteredFavouriteList.length),

                Expanded(
                  child: ListView.builder(
                    itemCount: provider.filteredFavouriteList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var favData = provider.filteredFavouriteList[index];
                      return FavorPostCardWidget(
                        imageUrl: favData.image,
                        title: favData.name,
                        price: favData.price,
                        rating: favData.rating,
                        brand: favData.name,
                        category: 'category',
                        onTap: () {
                          provider.removeFav(favData.id) ;
                        },
                        onTapDetail: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => DetailProductScreen(
                                id: favData.id,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
