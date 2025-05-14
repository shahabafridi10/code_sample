import 'package:evencir_task/Components/custom_appbar.dart';
import 'package:evencir_task/Components/custom_loader.dart';
import 'package:evencir_task/Components/label_with_value.dart';
import 'package:evencir_task/Components/section_header.dart';
import 'package:evencir_task/Provider/detail_product_provider.dart';
import 'package:evencir_task/Service/api_services.dart';
import 'package:evencir_task/Utils/app_constants.dart';
import 'package:evencir_task/Utils/app_text_themes.dart';
import 'package:flutter/material.dart';
import '../../Components/image_wrap_grid.dart';
import '../../Components/post_card.dart';
import '../../Components/rating_bar.dart';
import '../../Components/result_found.dart';
import '../../Components/search_bar.dart';
import '../../Provider/product_provider.dart';
import '../../Utils/app_assets_paths.dart';
import '../../Utils/app_colors.dart';
import 'package:provider/provider.dart';

class DetailProductScreen extends StatefulWidget {
  var id;
    DetailProductScreen({super.key , required this.id});

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  @override
  void initState() {
    Provider.of<DetailProductProvider>(context, listen: false).fetchDetailProductData(id: widget.id.toString());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,

      appBar: CustomAppBar(searchName: AppConstants.productsDetail,  navigator: 1),
      body: Consumer<DetailProductProvider>(
        builder: (
            BuildContext context,
            DetailProductProvider provider,
            Widget? child,
            ) {
          return SingleChildScrollView(
            child:
                provider.isLoading
          ? Container(
                  height: MediaQuery.of(context).size.height,
                  alignment: Alignment.center,
                  child: const CustomLoader(),
                ):

            Container(
              child: Column(
                children: [


                 Image.network(provider.detailProductData!.thumbnail.toString(), height: MediaQuery.sizeOf(context).height*0.3,
                 width: double.infinity, fit: BoxFit.cover,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppConstants.detProduct, style: AppTextThemes.black_post_title_theme,),
                            InkWell(
                                onTap:(){
                                  provider.addToFavorList(widget.id);
                                },
                                child: Image.asset(provider.favouriteList.contains(widget.id)?AssetPaths.redFavor:AssetPaths.favor, height: 25,width: 25,)),
                          ],
                        ),
                      ),

                      LabelWithValue(
                        label: AppConstants.name,
                        value: provider.detailProductData!.title.toString(),
                      ),
                      LabelWithValue(
                        label: AppConstants.price,
                        value: provider.detailProductData!.price.toString(),
                      ),LabelWithValue(
                        label: AppConstants.category,
                          value: provider.detailProductData!.category.toString(),
                      ),
                      LabelWithValue(
                        label: AppConstants.brand,
                        value: provider.detailProductData!.brand.toString(),
                      ),
                      LabelWithValue(
                        label: AppConstants.rating,

                        valueWidget: RatingBarWidget(rating: provider.detailProductData!.rating! ),
                      ),

                      LabelWithValue(
                        label: AppConstants.stock,
                        value: provider.detailProductData!.stock.toString(),
                      ),

                      SectionHeader(title:AppConstants.productsDetail, ),
                      Text(   provider.detailProductData!.description.toString(),style: AppTextThemes.black_normal_desc_theme,),

                      SectionHeader(title: AppConstants.productGallery),

                      ResponsiveImageWrap(imageUrls:  provider.detailProductData!.images!,),


                    ],),
                  ),


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ImageWrapGrid {
}
