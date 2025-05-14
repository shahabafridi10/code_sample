import 'package:flutter/material.dart';

class ResponsiveImageWrap extends StatelessWidget {
  final List<String> imageUrls;
  final double spacing;

  const ResponsiveImageWrap({
    Key? key,
    required this.imageUrls,
    this.spacing = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0),
      child: Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: imageUrls.map((url) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 3 - spacing * 2,
            ),
            child: AspectRatio(
              aspectRatio: 1, // square image
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: progress.expectedTotalBytes != null
                            ? progress.cumulativeBytesLoaded /
                            (progress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
