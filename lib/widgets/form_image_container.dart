import 'package:drchef/theme.dart';
import 'package:flutter/material.dart';

class FormImageContainer extends StatelessWidget {
  final Widget addImage;
  final List<Widget> imageWidget;
  const FormImageContainer(
      {super.key, required this.addImage, required this.imageWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        color: backgroundColor,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Upload your prescription or medical reports."),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: addImage,
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: imageWidget[index],
                          ),
                      itemCount: imageWidget.length),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
