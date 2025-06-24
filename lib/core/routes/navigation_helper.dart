import 'package:flutter/material.dart';
import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';
import 'package:flutter_website/features/home/presentation/screens/about_us_page.dart';
import 'package:flutter_website/features/home/presentation/screens/collection_page.dart';
import 'package:flutter_website/features/home/presentation/screens/contact_us_page.dart';
import 'package:flutter_website/features/home/presentation/screens/faq_page.dart';
import 'package:flutter_website/features/home/presentation/screens/home_page.dart';
import 'package:flutter_website/features/home/presentation/screens/product_details_page.dart';

class NavigationHelper {
  static const String homeRoute = '/';
  static const String faqRoute = '/faq';
  static const String contactUsRoute = '/contact';
  static const String aboutUsRoute = '/about';
  static const String productDetailsRoute = '/product';
  static const String collectionRoutePrefix = '/collection';

  static void goToHomePage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != homeRoute) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          settings: const RouteSettings(name: homeRoute),
          builder: (context) => const HomePage(),
        ),
        (Route<dynamic> route) => false,
      );
    }
  }

  static void goToCollection(BuildContext context, String type) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final targetRoute = '$collectionRoutePrefix/$type';
    if (currentRoute != targetRoute) {
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: RouteSettings(name: targetRoute),
          builder: (context) => CollectionPage(type: type),
        ),
      );
    }
  }

  static void goToProductDetailsPage(
      BuildContext context, ProductModel products) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != productDetailsRoute) {
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(name: productDetailsRoute),
          builder: (context) => ProductDetailsPage(products: products),
        ),
      );
    }
  }

  static void goToAboutUsPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != aboutUsRoute) {
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(name: aboutUsRoute),
          builder: (context) => AboutUsPage(),
        ),
      );
    }
  }

  static void goToContactUsPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != contactUsRoute) {
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(name: contactUsRoute),
          builder: (context) => ContactUsPage(),
        ),
      );
    }
  }

  static void goToFAQPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != faqRoute) {
      Navigator.push(
        context,
        MaterialPageRoute(
          settings: const RouteSettings(name: faqRoute),
          builder: (context) => FaqPage(),
        ),
      );
    }
  }
}
