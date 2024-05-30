import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

class PlacesForm extends StatefulWidget {
  const PlacesForm({super.key});

  @override
  State<PlacesForm> createState() => _PlacesFormState();
}

class _PlacesFormState extends State<PlacesForm> {
  final _titleController = TextEditingController();

  void _submitForm() {}

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
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Título'),
                    controller: _titleController,
                  ),
                  const SizedBox(height: 15),
                  const ImageInput(),
                ],
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
