import 'dart:io';

import 'package:flutter/foundation.dart';

class PlacesLocationModel {
  final double? latitude;
  final double? longitude;
  final String? address;

  PlacesLocationModel({
    @required this.latitude,
    @required this.longitude,
    @required this.address,
  });
}

class PlacesModel {
  final String? id;
  final String? title;
  // final ... location;
  final File? image;

  PlacesModel({
    @required this.id,
    @required this.title,
    // @required this.location,
    @required this.image,
  });
}
