

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class AddNewRecipePage extends StatefulWidget {
  const AddNewRecipePage({Key? key}) : super(key: key);

  @override
  State<AddNewRecipePage> createState() => _AddNewRecipePageState();
}

class _AddNewRecipePageState extends State<AddNewRecipePage> {
  File? _image;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _instructionsController = TextEditingController();
  TextEditingController _ingredientsController = TextEditingController();
  TextEditingController _timeToCookController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _instructionsController.dispose();
    _ingredientsController.dispose();
    _timeToCookController.dispose();
    super.dispose();
  }

  void _selectImage() async {
    // Use the image picker package to select an image from the gallery
    PickedFile? selectedImage = await ImagePicker().getImage(source: ImageSource.gallery);

    // Check if an image was selected
    if (selectedImage != null) {
      // Update the state with the selected image
      setState(() {
        _image = File(selectedImage.path);
      });
    }
  }


  void _submitForm() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            InkWell(
              onTap: _selectImage,
               child: _image != null
                   ? Image.file(_image!)
                   : Container(
                color: Colors.grey[300],
                height: 200,
                child: Icon(
                  IconlyLight.plus,
                  size: 80,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _instructionsController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Instructions',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _ingredientsController,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Ingredients',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _timeToCookController,
              decoration: InputDecoration(
                labelText: 'Time to Cook',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
