import 'package:flutter/material.dart';

class AddImage extends StatefulWidget {
  const AddImage({
    super.key,
    required this.onTap,
    this.width = 100,
    this.height = 100,
  });

  final VoidCallback onTap;
  final double width;
  final double height;

  @override
  State<AddImage> createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  bool tapped = false;
  bool hovered = false;

  Color get buttonColor {
    var state = (hovered, tapped);
    return switch (state) {
      (_, true) => Colors.black,
      (true, _) => Colors.grey,
      (_, _) => Colors.white,
    };
  }

  Color get iconColor {
    var state = (hovered, tapped);
    return switch (state) {
      (_, true) => Colors.white,
      (true, _) => Colors.black,
      (_, _) => Colors.black,
    };
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          hovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          hovered = false;
        });
      },
      child: GestureDetector(
        onTapDown: (details) {
          setState(() {
            tapped = true;
          });
        },
        onTapUp: (details) {
          setState(() {
            tapped = false;
          });
          widget.onTap();
        },
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Container(
              decoration: BoxDecoration(
                color: buttonColor,
              ),
              child: Center(
                child: Icon(
                  Icons.add_a_photo_rounded,
                  size: 32,
                  color: iconColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
