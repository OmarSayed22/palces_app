import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

import '../application/resources/values_manager.dart';

class GetLocationWidget extends StatefulWidget {
  const GetLocationWidget({super.key});

  @override
  State<GetLocationWidget> createState() => _GetLocationWidgetState();
}

class _GetLocationWidgetState extends State<GetLocationWidget> {
  bool _isLocationGaranted = false;

void _getCurrentLocation()async{
  Location location =  Location();
  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;
  serviceEnabled = await location.serviceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await location.requestService();
    if (!serviceEnabled) {
      return;
    }
  }
  permissionGranted = await location.hasPermission();
  if (permissionGranted == PermissionStatus.denied) {
    permissionGranted = await location.requestPermission();
    if (permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
setState(() {
  _isLocationGaranted=true;
});
  locationData = await location.getLocation();
  setState(() {
    _isLocationGaranted=false;
  });

  log(locationData.latitude.toString());
  log(locationData.longitude.toString());
}

  void _selectOnMap(){}

  @override
  Widget build(BuildContext context) {
  Widget _containerContent=Text(
    "No location selected yet",
    style: Theme.of(context).textTheme.titleMedium,
  );
  if(_isLocationGaranted){
    _containerContent=const Center(child: CircularProgressIndicator());
  }
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              border: Border.all(
                  width: AppSize.size1, color: Theme.of(context).primaryColor),
              borderRadius:
                  const BorderRadius.all(Radius.circular(AppSize.size10))),
          child: _containerContent
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: _getCurrentLocation,
                icon: const Icon(Icons.location_on),
                label: const Text('Get Current Location'),),
            TextButton.icon(
                onPressed:_selectOnMap ,
                icon: const Icon(Icons.map),
                label: const Text('Select on Map'),)
          ]
          ,
        )
      ],
    );
  }
}
