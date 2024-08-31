import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatelessWidget {
  final XFile image;
  final void Function()? onRemove;
  const ImageWidget({
    super.key,
    required this.image,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onRemove,
            iconSize: 20,
          ),
        ),
        Image.file(
          File(image.path),
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
