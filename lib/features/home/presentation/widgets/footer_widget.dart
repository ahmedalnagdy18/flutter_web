import 'package:flutter/material.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/core/routes/navigation_helper.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      color: Colors.black,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Website",
                style: AppTexts.title.copyWith(color: Colors.white),
              ),
              SizedBox(height: 20),
              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _footerLinks(context),
                )
              else
                Row(
                  children: _footerLinks(context),
                ),
              SizedBox(height: 30),
              Divider(color: Colors.white24),
              SizedBox(height: 20),
              Text(
                "@ 2025 All rights reserved",
                style: AppTexts.small.copyWith(color: Colors.white70),
              ),
            ],
          );
        },
      ),
    );
  }
}

List<Widget> _footerLinks(BuildContext context) {
  return [
    TextButton(
        style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.grey)),
        onPressed: () {
          NavigationHelper.goToAboutUsPage(context);
        },
        child: Text("About us", style: TextStyle(color: Colors.white))),
    SizedBox(width: 14),
    TextButton(
        style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.grey)),
        onPressed: () {
          NavigationHelper.goToContactUsPage(context);
        },
        child: Text("Contact us", style: TextStyle(color: Colors.white))),
    SizedBox(width: 14),
    TextButton(
        style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.grey)),
        onPressed: () {},
        child: Text("Help", style: TextStyle(color: Colors.white))),
    SizedBox(width: 14),
    TextButton(
        style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.grey)),
        onPressed: () {},
        child: Text("Privacy", style: TextStyle(color: Colors.white))),
  ];
}
