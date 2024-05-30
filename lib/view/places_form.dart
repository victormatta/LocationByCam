import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/viewmodel/places_viewmodel.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:provider/provider.dart';

class PlacesForm extends StatefulWidget {
  const PlacesForm({super.key});

  @override
  State<PlacesForm> createState() => _PlacesFormState();
}

class _PlacesFormState extends State<PlacesForm> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    print(_titleController);
    print(_pickedImage);
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<PlacesViewModel>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage!,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Place',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(labelText: 'Título'),
                      controller: _titleController,
                    ),
                    const SizedBox(height: 15),
                    ImageInput(onSelectImage: _selectImage),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: _submitForm,
                  icon: const Icon(Icons.add, color: Colors.black),
                  label: const Text(
                    'Adicionar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 255, 230, 0)),
                    elevation: MaterialStatePropertyAll(0),
                    shape: MaterialStatePropertyAll(LinearBorder()),
                    minimumSize: MaterialStatePropertyAll(Size(0, 60)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
