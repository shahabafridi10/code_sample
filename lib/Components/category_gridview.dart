// import 'package:evencir_task/Utils/app_text_themes.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// class CategoryGridItem extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//
//   const CategoryGridItem({
//     Key? key,
//     required this.imageUrl,
//     required this.title,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         image: DecorationImage(
//           // image: NetworkImage(imageUrl),
//           image: CachedNetworkImage(
//             imageUrl: "http://via.placeholder.com/350x150",
//             placeholder: (context, url) => new CircularProgressIndicator(),
//             errorWidget: (context, url, error) => new Icon(Icons.error),
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Container(
//         color: Colors.transparent,
//         alignment: Alignment.bottomLeft,
//         child: Padding(
//           padding: const EdgeInsets.only(left: 8.0,bottom: 30),
//           child: Text(
//             title,
//             style: AppTextThemes.display_medium_theme,
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:evencir_task/Utils/app_text_themes.dart';

class CategoryGridItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final onTap;

  const CategoryGridItem({
    Key? key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [

            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error, color: Colors.red);
              },
            ),


            // Overlay color for better text visibility
            Container(color: Colors.black.withOpacity(0.3)),

            // Title text
            Positioned(
              bottom: 30,
              left: 5,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width/3,
                child: Text(
                  title,
                  style: AppTextThemes.display_medium_theme.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
