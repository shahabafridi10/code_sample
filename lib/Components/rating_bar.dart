import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
    var rating;
  final void Function(double)? onRatingUpdate;

    RatingBarWidget({
    Key? key,
    required this.rating,
    this.onRatingUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RatingBar.builder(
          initialRating:  rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 13,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: onRatingUpdate ?? (rating) {
            print("Rated: $rating");
          },
        ),
        Positioned.fill(
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
