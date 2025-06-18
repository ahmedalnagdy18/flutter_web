import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount(double width) {
      if (width < 600) return 2; // mobile
      if (width < 1000) return 3; // tablet
      return 4; // desktop
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: appHight(context, 0.25),
              width: double.infinity,
              color: Colors.black,
              child: Center(
                  child: Text(
                "$type Collection",
                style: AppTexts.subTitle,
              )),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text("$type Sport Item", style: AppTexts.title),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GridView.builder(
                  itemCount: 12,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: getCrossAxisCount(screenWidth),
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: getCrossAxisCount(screenWidth),
                      duration: const Duration(milliseconds: 600),
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    "images/cover.jpg",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                                Text(
                                  "Name  ${index + 1}",
                                  style: AppTexts.small,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  "price \$${index + 1}",
                                  style: AppTexts.small,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(height: 50),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
