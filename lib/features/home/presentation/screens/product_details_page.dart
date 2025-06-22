import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/app_buttons.dart';
import 'package:flutter_website/core/common/appbar_common_widget.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // appbar part
            AppbarCommonWidget(title: 'Product details'),

            SizedBox(height: 50),
            isMobile
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset('images/cover.jpg')),
                            SizedBox(width: 12),
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset('images/cover.jpg')),
                            SizedBox(width: 12),
                            SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset('images/cover.jpg')),
                          ],
                        ),
                        SizedBox(height: 12),
                        Image.asset('images/cover.jpg'),
                        SizedBox(height: 12),
                        Text("Item Name", style: AppTexts.title),
                        SizedBox(height: 12),
                        Text("\$ Price",
                            style: AppTexts.small
                                .copyWith(color: AppColors.primaryColor)),
                        SizedBox(height: 12),
                        Text(
                          "description description description description description",
                          style: AppTexts.small,
                        ),
                        SizedBox(height: 12),
                        MainAppButton(onPressed: () {}, text: "Add to cart"),
                      ],
                    ),
                  )
                : Center(
                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      height: appHight(context, isMobile ? 0.50 : 0.30),
                      color: AppColors.lightGrey,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Expanded(
                                    child: Image.asset('images/cover.jpg')),
                                SizedBox(height: 12),
                                Expanded(
                                    child: Image.asset('images/cover.jpg')),
                                SizedBox(height: 12),
                                Expanded(
                                    child: Image.asset('images/cover.jpg')),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                              flex: 2,
                              child: Image.asset(
                                'images/cover.jpg',
                                fit: BoxFit.fill,
                              )),
                          SizedBox(width: 12),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Item Name", style: AppTexts.title),
                                SizedBox(height: 12),
                                Text("\$ Price",
                                    style: AppTexts.small.copyWith(
                                        color: AppColors.primaryColor)),
                                SizedBox(height: 12),
                                Expanded(
                                  child: Text(
                                    "describtion describtion describtion describtion describtion",
                                    style: AppTexts.small,
                                  ),
                                ),
                                MainAppButton(
                                  onPressed: () {},
                                  text: "Add to cart",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            SizedBox(height: 150),
            // footer part
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
