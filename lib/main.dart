import 'package:dog/presenter/pages/dog_image_page.dart';
import 'package:flutter/material.dart';

import 'core/dependency_factory.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DogImagePage(notifier: DependencyFactory.createDogImageNotifier()),
    );
  }
}
