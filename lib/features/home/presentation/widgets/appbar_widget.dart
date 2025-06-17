import 'package:flutter/material.dart';
import 'package:flutter_website/core/fonts/app_text.dart';

class AppbarMobileWidget extends StatelessWidget {
  const AppbarMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("WEBSITE", style: AppTexts.title),
        const SizedBox(width: 20),
        TextButton(onPressed: () {}, child: const Text("Bags")),
        const SizedBox(width: 12),
        TextButton(onPressed: () {}, child: const Text("Men")),
        const SizedBox(width: 12),
        TextButton(onPressed: () {}, child: const Text("Women")),
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
        Text("WEBSITE", style: AppTexts.title),
        const SizedBox(width: 33),
        TextButton(onPressed: () {}, child: const Text("Bags")),
        const SizedBox(width: 12),
        TextButton(onPressed: () {}, child: const Text("Men")),
        const SizedBox(width: 12),
        TextButton(onPressed: () {}, child: const Text("Women")),
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
