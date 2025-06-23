import 'package:flutter/material.dart';
import 'package:flutter_website/features/home/presentation/screens/about_us_page.dart';
import 'package:flutter_website/features/home/presentation/screens/collection_page.dart';
import 'package:flutter_website/features/home/presentation/screens/contact_us_page.dart';
import 'package:flutter_website/features/home/presentation/screens/product_details_page.dart';

class NavigationHelper {
  static void goToCollection(BuildContext context, String type) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CollectionPage(type: type),
      ),
    );
  }

  static void goToProductDetailsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(),
      ),
    );
  }

  static void goToAboutUsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AboutUsPage(),
      ),
    );
  }

  static void goToContactUsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactUsPage(),
      ),
    );
  }
}
