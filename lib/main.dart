import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_website/core/common/app_asset_image.dart';
import 'package:flutter_website/features/home/presentation/cubits/add_to_cart/add_to_card_cubit.dart';
import 'package:flutter_website/features/home/presentation/screens/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToCardCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const PrecacheWrapper(child: HomePage()),
      ),
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
    precacheImage(AssetImage(AppAssetImage.bags), context);
    precacheImage(AssetImage(AppAssetImage.woman), context);
    precacheImage(AssetImage(AppAssetImage.men), context);
    precacheImage(AssetImage(AppAssetImage.noConnection), context);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
