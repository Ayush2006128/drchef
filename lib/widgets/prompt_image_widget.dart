import 'package:drchef/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

typedef OnTapRemoveImageCallback = void Function(XFile);

class PromptImage extends StatelessWidget {
  const PromptImage({
    super.key,
    required this.file,
    this.onTapIcon,
    this.width = 100,
  });

  final XFile file;
  final VoidCallback? onTapIcon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                foregroundDecoration: BoxDecoration(
                  image: ImageWidget.decoration(file),
                ),
              ),
            ),
          ),
          if (onTapIcon != null)
            Positioned(
              right: 5,
              top: 5,
              child: GestureDetector(
                onTap: onTapIcon,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
