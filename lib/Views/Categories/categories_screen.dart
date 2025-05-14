import 'package:evencir_task/Components/custom_loader.dart';
import 'package:evencir_task/Provider/categories_provider.dart';
import 'package:evencir_task/Views/Product/product_screen.dart';
import 'package:evencir_task/Views/ProductsByCategories/products_by_categories_screen.dart';
import 'package:flutter/material.dart';

import '../../Components/category_gridview.dart';
import '../../Components/custom_appbar.dart';
import '../../Components/result_found.dart';
import '../../Components/search_bar.dart';
import '../../Utils/app_colors.dart';
import '../../Utils/app_constants.dart';
import 'package:provider/provider.dart';

import '../DetailProduct/detail_product_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  @override
  void initState() {
    Provider.of<CategoriesProvider>(context, listen: false).fetchCategories();

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,

      appBar: CustomAppBar(searchName: AppConstants.categories, navigator: 0,),
      body: Consumer<CategoriesProvider>(
        builder: (
          BuildContext context,
          CategoriesProvider provider,
          Widget? child,
        ) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12),

            child: Column(
              children: [
                SearchBarComponent(
                  onChanged: (v) {
                    provider.filterCategories(v);
                  },
                ),

                provider.isLoading
                    ? SizedBox()
                    : provider.filteredCategories.length ==
                        provider.categoriesData?.length
                    ? SizedBox()
                    : ResultCountTextWidget(
                      count: provider.filteredCategories.length,
                    ),

               Expanded(
                  child:provider.isLoading
                   ? CustomLoader() : GridView.builder(
                    padding: const EdgeInsets.all(6),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.9,
                    ),
                    itemCount: provider.filteredCategories.length,
                    itemBuilder: (context, index) {
                      final category = provider.filteredCategories[index];
                      return CategoryGridItem(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => ProductBYCategoriesScreen(slug: 1,

                              ),
                            ),
                          );

                        },
                        imageUrl: category.url!,
                        title: category.name!,
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
