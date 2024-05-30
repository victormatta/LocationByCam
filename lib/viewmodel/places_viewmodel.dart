import 'package:flutter/material.dart';
import 'package:great_places/model/places_model.dart';

class PlacesViewModel with ChangeNotifier {
  List<PlacesModel> _items = [];

  List<PlacesModel> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  PlacesModel itemByIndex(int index) {
    return _items[index];
  }
}
