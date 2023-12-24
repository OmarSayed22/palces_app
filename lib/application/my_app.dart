import 'package:flutter/material.dart';
import 'package:places_app/providers/user_places_provider_provider.dart';
import 'package:provider/provider.dart';

import '../screens/places_screen.dart';
import 'di.dart';
import 'resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initAppModule();
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserPlacesProvider(),
      child: MaterialApp(
          theme: AppTheme.dark(),
          home: const PlacesScreen()
      ),
    );
  }
}
