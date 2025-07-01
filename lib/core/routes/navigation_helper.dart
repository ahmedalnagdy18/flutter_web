import 'package:flutter/material.dart';
import 'package:flutter_website/features/authentication/presentation/screens/login_page.dart';
import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';
import 'package:flutter_website/features/home/presentation/screens/about_us_page.dart';
import 'package:flutter_website/features/home/presentation/screens/cart_page.dart';
import 'package:flutter_website/features/home/presentation/screens/collection_page.dart';
import 'package:flutter_website/features/home/presentation/screens/contact_us_page.dart';
import 'package:flutter_website/features/home/presentation/screens/faq_page.dart';
import 'package:flutter_website/features/home/presentation/screens/home_page.dart';
import 'package:flutter_website/features/home/presentation/screens/order_complete_page.dart';
import 'package:flutter_website/features/home/presentation/screens/product_details_page.dart';

class NavigationHelper {
  static const String homeRoute = '/';
  static const String faqRoute = '/faq';
  static const String contactUsRoute = '/contact';
  static const String aboutUsRoute = '/about';
  static const String productDetailsRoute = '/product';
  static const String collectionRoutePrefix = '/collection';
  static const String cartRoute = '/cart';
  static const String orderCompleteRoute = '/order';
  static const String loginRoute = '/login';

  static void goToHomePage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != homeRoute) {
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          settings: const RouteSettings(name: homeRoute),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const HomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
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
        PageRouteBuilder(
          settings: RouteSettings(name: targetRoute),
          pageBuilder: (context, animation, secondaryAnimation) =>
              CollectionPage(type: type),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
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
        PageRouteBuilder(
          settings: const RouteSettings(name: productDetailsRoute),
          pageBuilder: (context, animation, secondaryAnimation) =>
              ProductDetailsPage(products: products),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  static void goToAboutUsPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != aboutUsRoute) {
      Navigator.push(
        context,
        PageRouteBuilder(
          settings: const RouteSettings(name: aboutUsRoute),
          pageBuilder: (context, animation, secondaryAnimation) =>
              AboutUsPage(),
          //   transitionDuration: Duration(milliseconds: 0), // No animation
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  static void goToContactUsPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != contactUsRoute) {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ContactUsPage(),
          settings: const RouteSettings(name: contactUsRoute),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  static void goToFAQPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != faqRoute) {
      Navigator.push(
        context,
        PageRouteBuilder(
          settings: const RouteSettings(name: faqRoute),
          pageBuilder: (context, animation, secondaryAnimation) => FaqPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  static void goToCartPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != cartRoute) {
      Navigator.push(
        context,
        PageRouteBuilder(
          settings: const RouteSettings(name: cartRoute),
          pageBuilder: (context, animation, secondaryAnimation) => CartPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }

  static void goToOrderCompletedPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != orderCompleteRoute) {
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          settings: const RouteSettings(name: orderCompleteRoute),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OrderCompletePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
        (Route<dynamic> route) => false,
      );
    }
  }

  static void goToLoginPage(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    if (currentRoute != loginRoute) {
      Navigator.push(
        context,
        PageRouteBuilder(
          settings: const RouteSettings(name: loginRoute),
          pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    }
  }
}
