import 'package:drchef/widgets/add_image.dart';
import 'package:drchef/widgets/form_image_container.dart';
import 'package:drchef/widgets/prompt_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List<XFile> _images = List.empty(growable: true);
  void _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images.add(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: const Text("Dr Chef"),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        SliverToBoxAdapter(
          child: FormImageContainer(
            addImage: AddImage(onTap: _pickImage),
            imageWidget: _images
                .map(
                  (i) => PromptImage(
                    file: i,
                    onTapIcon: () {
                      setState(() {
                        _images.remove(i);
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ));
  }
}
