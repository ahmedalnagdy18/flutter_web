import 'package:flutter/material.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/widgets/appbar_widget.dart';
import 'package:flutter_website/features/home/presentation/widgets/collection_widget.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        scrollDirection: Axis.vertical,
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
              height: appHight(context, 0.60),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Image.asset(
                "images/cover.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Center(child: Text("Gear Up. Stand Out.", style: AppTexts.title)),
            SizedBox(height: 30),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "High-performance sportswear designed for comfort, style, and results — built to move when you do.",
                  style: AppTexts.regular,
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GridView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: getCrossAxisCount(screenWidth),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
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
                          "price ${index + 1}",
                          style: AppTexts.small,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            // collection part
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text("Collection", style: AppTexts.title),
            ),
            SizedBox(height: 30),
            CollectionWidget(),
            SizedBox(height: 50),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Explore Our Featured Collection",
                      style: AppTexts.title,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Find the latest trends and timeless pieces designed to match your lifestyle.",
                      style: AppTexts.regular,
                    ),
                    const SizedBox(height: 30),
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
