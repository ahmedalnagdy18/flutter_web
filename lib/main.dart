import 'package:flutter/material.dart';
import 'package:flutter_website/core/common/app_asset_image.dart';
import 'package:flutter_website/features/home/presentation/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PrecacheWrapper(child: HomePage()),
    );
  }
}

class PrecacheWrapper extends StatefulWidget {
  final Widget child;
  const PrecacheWrapper({required this.child, super.key});

  @override
  State<PrecacheWrapper> createState() => _PrecacheWrapperState();
}

class _PrecacheWrapperState extends State<PrecacheWrapper> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage(AppAssetImage.cover), context);
    precacheImage(AssetImage(AppAssetImage.aboutUs), context);
    precacheImage(AssetImage(AppAssetImage.contactUs), context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
