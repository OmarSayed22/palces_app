import 'package:flutter/material.dart';

import '../models/models.dart';

class UserPlacesProvider extends ChangeNotifier {
final List<Place> _places=[];
List<Place> get  places =>_places;

void addPlace(Place place) {
  _places.add(place);
  notifyListeners() ;
  }

}
