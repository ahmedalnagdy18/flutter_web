import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/core/routes/navigation_helper.dart';

class AppbarMobileWidget extends StatelessWidget {
  const AppbarMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () => NavigationHelper.goToHomePage(context),
            child: Text("WEBSITE", style: AppTexts.title)),
        const SizedBox(width: 20),
        TextButton(
            onPressed: () => NavigationHelper.goToCollection(context, 'Bags'),
            child: Text(
              "Bags",
              style: TextStyle(color: AppColors.primaryColor),
            )),
        const SizedBox(width: 12),
        TextButton(
            onPressed: () => NavigationHelper.goToCollection(context, 'Men'),
            child: Text(
              "Men",
              style: TextStyle(color: AppColors.primaryColor),
            )),
        const SizedBox(width: 12),
        TextButton(
            onPressed: () => NavigationHelper.goToCollection(context, 'Women'),
            child: Text(
              "Women",
              style: TextStyle(color: AppColors.primaryColor),
            )),
        const SizedBox(width: 12),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        const SizedBox(width: 12),
        IconButton(onPressed: () {}, icon: const Icon(Icons.person_2_outlined)),
        const SizedBox(width: 12),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_basket_outlined)),
      ],
    );
  }
}

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () => NavigationHelper.goToHomePage(context),
            child: Text("WEBSITE", style: AppTexts.title)),
        const SizedBox(width: 33),
        TextButton(
            onPressed: () => NavigationHelper.goToCollection(context, 'Bags'),
            child: Text(
              "Bags",
              style: TextStyle(color: AppColors.primaryColor),
            )),
        const SizedBox(width: 12),
        TextButton(
            onPressed: () => NavigationHelper.goToCollection(context, 'Men'),
            child: Text(
              "Men",
              style: TextStyle(color: AppColors.primaryColor),
            )),
        const SizedBox(width: 12),
        TextButton(
            onPressed: () => NavigationHelper.goToCollection(context, 'Women'),
            child: Text(
              "Women",
              style: TextStyle(color: AppColors.primaryColor),
            )),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
        const SizedBox(width: 12),
        IconButton(onPressed: () {}, icon: const Icon(Icons.person_2_outlined)),
        const SizedBox(width: 12),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.shopping_basket_outlined)),
      ],
    );
  }
}
