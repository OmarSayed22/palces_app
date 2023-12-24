import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../application/di.dart';
import '../application/resources/values_manager.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key, required this.onSelectedImage});
  final void Function(File image) onSelectedImage;
  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    void _takePhoto() async {
      final imagePicker = instance<ImagePicker>();
      final XFile? pickedImage =
          await imagePicker.pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        selectedImage = File(pickedImage.path);
        setState(() {});
        widget.onSelectedImage(selectedImage!);
      }
    }

    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            border: Border.all(
                width: AppSize.size1, color: Theme.of(context).primaryColor),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppSize.size10))),
        child: selectedImage == null
            ? TextButton.icon(
                onPressed: _takePhoto,
                icon: const Icon(Icons.camera),
                label: const Text('Take Photo'))
            : GestureDetector(
                onTap: _takePhoto,
                child: ClipRRect(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppSize.size10)),
                    child: Image.file(
                      selectedImage!,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: double.infinity,
                    ))));
  }
}
