import 'package:evencir_task/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../Utils/app_constants.dart';

class SearchBarComponent extends StatelessWidget {
  final Function(String) onChanged;

  const SearchBarComponent({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kWhiteColor,
          borderRadius: BorderRadius.circular(8.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 1,
          //     blurRadius: 3,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: AppConstants.search,
            hintStyle: const TextStyle(color: Colors.black), // ✅ Hint text color
            prefixIcon: const Icon(Icons.search, color: Colors.black), // Optional: black icon
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.black), // ✅ Black border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.black, width: 1.5), // ✅ Thicker border on focus
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
