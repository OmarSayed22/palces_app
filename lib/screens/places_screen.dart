import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_places_provider_provider.dart';
import 'add_place_screen.dart';
import 'places_list.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPlaceProvider = Provider.of<UserPlacesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddPlaceScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: PlacesList(),
    );
  }
}
