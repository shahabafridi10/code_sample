import 'package:evencir_task/Components/custom_appbar.dart';
import 'package:evencir_task/Components/custom_loader.dart';
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

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    Provider.of<ProductProvider>(context, listen: false).fetchProducts();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,

      appBar: CustomAppBar(searchName: AppConstants.products, navigator: 0),
      body: Consumer<ProductProvider>(
        builder: (
          BuildContext context,
          ProductProvider provider,
          Widget? child,
        ) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                SearchBarComponent(
                  onChanged: (v) {
                    provider.filterProducts(v);
                  },
                ),

                provider.isLoading
                    ? SizedBox()
                    : provider.filteredProducts.length ==
                        provider.productData?.products?.length
                    ? SizedBox()
                    : ResultCountTextWidget(
                      count: provider.filteredProducts.length,
                    ),

                Expanded(
                  child:
                      provider.isLoading
                          ? const CustomLoader()
                          : provider.filteredProducts.isEmpty
                          ? Center(child: Text(AppConstants.result_not_found))
                          : ListView.builder(
                            itemCount: provider.filteredProducts.length,
                            itemBuilder: (context, index) {
                              final product = provider.filteredProducts[index];
                              return ProductCardWidget(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (context) => DetailProductScreen(
                                            id: product.id,
                                          ),
                                    ),
                                  );
                                },
                                imageUrl: product.thumbnail,
                                title: product.title,
                                price: product.price,
                                rating: product.rating,
                                brand: product.brand ?? 'Local',
                                category: product.category,
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
