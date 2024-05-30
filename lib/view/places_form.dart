import 'package:flutter/material.dart';

class PlacesForm extends StatefulWidget {
  const PlacesForm({super.key});

  @override
  State<PlacesForm> createState() => _PlacesFormState();
}

class _PlacesFormState extends State<PlacesForm> {
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
      body: const Center(
        child: Text('Formssssssss'),
      ),
    );
  }
}
