import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double height;
  final double width;

  const CustomSizedBox({
    Key? key,
    this.height = 16.0, // Default height
    this.width = 16.0,  // Default width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
