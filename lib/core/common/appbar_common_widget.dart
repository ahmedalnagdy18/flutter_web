import 'package:flutter/material.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/widgets/appbar_widget.dart';

class AppbarCommonWidget extends StatelessWidget {
  const AppbarCommonWidget({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: appHight(context, 0.10),
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.white),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 800) {
                    // Scrollable version for small screens
                    return AppbarMobileWidget();
                  } else {
                    // Normal layout for wide screens
                    return AppbarWidget();
                  }
                },
              )),
        ),
        Container(
          height: appHight(context, 0.20),
          width: double.infinity,
          color: Colors.black,
          child: Center(
              child: Text(
            title,
            style: AppTexts.subTitle,
          )),
        ),
      ],
    );
  }
}
