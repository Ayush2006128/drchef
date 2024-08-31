import 'package:flutter/material.dart';

class FormImageContainer extends StatelessWidget {
  final Widget addImage;
  final List<Widget> imageWidget;
  const FormImageContainer(
      {super.key, required this.addImage, required this.imageWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: addImage),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => imageWidget[index],
                itemCount: imageWidget.length),
          ),
        ),
      ],
    );
  }
}
