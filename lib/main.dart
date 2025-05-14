import 'package:evencir_task/Provider/categories_provider.dart';
import 'package:evencir_task/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'Provider/categories_by_product.dart';
import 'Provider/detail_product_provider.dart';
import 'Provider/product_provider.dart';
import 'Views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>HomeProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CategoriesProvider()),
        ChangeNotifierProvider(create: (context) => CategoriesByProductProvider()),
        ChangeNotifierProvider(create: (context) => DetailProductProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evensic Task',
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          useMaterial3: true,
        ),
        home: const Splashscreen( ),
      ),
    );
  }
}


