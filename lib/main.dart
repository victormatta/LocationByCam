import 'package:flutter/material.dart';
import 'package:great_places/utils/routes/routes.dart';
import 'package:great_places/view/places_form.dart';
import 'package:great_places/view/places_list_view.dart';
import 'package:great_places/viewmodel/places_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(const PlaceApp());

class PlaceApp extends StatelessWidget {
  const PlaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlacesViewModel()),
      ],
      child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primaryColor: Colors.yellow,
        ),
        routes: {
          Routes.HOME: (context) => const PlacesListView(),
          Routes.PLACE_FORM: (context) => const PlacesForm(),
        },
      ),
    );
  }
}
