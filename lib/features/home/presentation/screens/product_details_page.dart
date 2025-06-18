import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/widgets/appbar_widget.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // appbar part
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
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: AppbarMobileWidget(),
                        );
                      } else {
                        // Normal layout for wide screens
                        return AppbarWidget();
                      }
                    },
                  )),
            ),
            Container(
              height: appHight(context, 0.25),
              width: double.infinity,
              color: Colors.black,
              child: Center(
                  child: Text(
                "Product details",
                style: AppTexts.subTitle,
              )),
            ),
            SizedBox(height: 50),

            Center(
              child: Container(
                padding: EdgeInsets.all(12),
                width: appWidth(context, 0.60),
                height: appHight(context, 0.30),
                color: AppColors.lightGrey,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Expanded(child: Image.asset('images/cover.jpg')),
                        SizedBox(height: 12),
                        Expanded(child: Image.asset('images/cover.jpg')),
                        SizedBox(height: 12),
                        Expanded(child: Image.asset('images/cover.jpg')),
                      ],
                    ),
                    SizedBox(width: 12),
                    Image.asset('images/cover.jpg'),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Item Name"),
                          SizedBox(height: 12),
                          Text("\$ Price"),
                          SizedBox(height: 12),
                          Expanded(
                            child: Text(
                              "describtion describtion describtion describtion describtion",
                              style: AppTexts.small,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            // footer part
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
