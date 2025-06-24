import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/app_buttons.dart';
import 'package:flutter_website/core/common/appbar_common_widget.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/core/routes/navigation_helper.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  List<bool> hovered = List.generate(4, (_) => false);
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppbarCommonWidget(title: 'About Us'),
            SizedBox(height: 50),
            isMobile
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 150,
                              width: 150,
                              child: Image.asset('images/about_us.png')),
                          Text(
                            "Know About Our Ecomerce Business, History",
                            style: AppTexts.title,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "describtion describtion describtion describtion describtion describtion describtion",
                            style: AppTexts.small,
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 150,
                            child: MainAppButton(
                              onPressed: () {
                                NavigationHelper.goToContactUsPage(context);
                              },
                              text: "Contact us",
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: 300,
                            width: 300,
                            child: Image.asset('images/about_us.png')),
                        SizedBox(width: 20),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Know About Our Ecomerce Business, History",
                                style: AppTexts.title,
                              ),
                              SizedBox(height: 20),
                              Text(
                                "describtion describtion describtion describtion describtion describtion describtion",
                                style: AppTexts.small,
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: 150,
                                child: MainAppButton(
                                  onPressed: () {},
                                  text: "Contact us",
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
            SizedBox(height: 50),
            Text(
              "Our Features",
              style: AppTexts.title,
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 2 : 4,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 200,
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: isMobile ? 2 : 4,
                      duration: const Duration(milliseconds: 600),
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: InkWell(
                            onHover: (hovering) {
                              setState(() {
                                hovered[index] = hovering;
                              });
                            },
                            onTap: () {},
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(
                                    color: hovered[index]
                                        ? AppColors.primaryColor
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Image.asset(images[index])),
                                  Text(
                                    title[index],
                                    style: AppTexts.medium,
                                    textAlign: TextAlign.center,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Text(
                                        "description description description description description",
                                        style: AppTexts.small
                                            .copyWith(color: Colors.grey),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 70),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}

List images = [
  'images/delivery.png',
  'images/cashback.png',
  'images/premium.png',
  'images/support.png',
];

List title = [
  'Free Delivery',
  '100% Cash Back',
  'Quality Product',
  '24 Support',
];
