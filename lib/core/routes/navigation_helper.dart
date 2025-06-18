import 'package:flutter/material.dart';
import 'package:flutter_website/features/home/presentation/screens/collection_page.dart';

class NavigationHelper {
  static void goToCollection(BuildContext context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CollectionPage(type: type),
      ),
    );
  }
}
