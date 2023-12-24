import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../application/resources/values_manager.dart';
import '../models/models.dart';
import '../providers/user_places_provider_provider.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});


  @override
  Widget build(BuildContext context) {
    return Consumer<UserPlacesProvider>(
      builder: (context, provider, child) {
        List<Place> placesList=provider.places;
        if (placesList.isEmpty) {
          return Center(
            child: Text(
              "No places added yet",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium,
            ),
          );
        }
        return ListView.builder(
            itemCount: placesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: ListTile(
                  title: Text(placesList[index].title),
                  leading: CircleAvatar(
                    radius: AppSize.size30,
                    backgroundImage:FileImage(placesList[index].image) ,
                  ),
                ),
              );
            });
      },
    );
  }
}
