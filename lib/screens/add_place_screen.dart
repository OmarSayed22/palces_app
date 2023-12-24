import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places_app/application/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/user_places_provider_provider.dart';
import 'get_location_widget.dart';
import 'image_picker_widget.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userPlaceProvider = Provider.of<UserPlacesProvider>(context);
    File? _selectrdImage;
    return Scaffold(
      appBar: AppBar(title: const Text('Add Palce')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.size16,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Title"),
              onSaved: (input) {},
              controller: _titleController,
            ),
            const SizedBox(
              height: AppSize.size16,
            ),
            ImagePickerWidget(
              onSelectedImage: (File image) {
                _selectrdImage = image;
              },
            ),
            const SizedBox(
              height: AppSize.size16,
            ),
            const GetLocationWidget(),
            const SizedBox(
              height: AppSize.size16,
            ),
            ElevatedButton.icon(
              onPressed: () {
                final title = _titleController.text;
                if (title.isNotEmpty || _selectrdImage != null) {
                  Place newPlace = Place(title: title, image: _selectrdImage!);
                  userPlaceProvider.addPlace(newPlace);
                  _titleController.clear();
                }

                Navigator.pop(context);
              },
              label: const Text("Add"),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
