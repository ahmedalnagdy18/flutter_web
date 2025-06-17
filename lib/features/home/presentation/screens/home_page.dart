import 'package:flutter/material.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Decide crossAxisCount based on width
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
                          child: Row(
                            children: [
                              Text("WEBSITE", style: AppTexts.title),
                              const SizedBox(width: 20),
                              TextButton(
                                  onPressed: () {}, child: const Text("Bags")),
                              const SizedBox(width: 12),
                              TextButton(
                                  onPressed: () {}, child: const Text("Men")),
                              const SizedBox(width: 12),
                              TextButton(
                                  onPressed: () {}, child: const Text("Women")),
                              const SizedBox(width: 12),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.search_outlined)),
                              const SizedBox(width: 12),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.person_2_outlined)),
                              const SizedBox(width: 12),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                      Icons.shopping_basket_outlined)),
                            ],
                          ),
                        );
                      } else {
                        // Normal layout for wide screens
                        return Row(
                          children: [
                            Text("WEBSITE", style: AppTexts.title),
                            const SizedBox(width: 33),
                            TextButton(
                                onPressed: () {}, child: const Text("Bags")),
                            const SizedBox(width: 12),
                            TextButton(
                                onPressed: () {}, child: const Text("Men")),
                            const SizedBox(width: 12),
                            TextButton(
                                onPressed: () {}, child: const Text("Women")),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search_outlined)),
                            const SizedBox(width: 12),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.person_2_outlined)),
                            const SizedBox(width: 12),
                            IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.shopping_basket_outlined)),
                          ],
                        );
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text("Collection", style: AppTexts.title),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: SizedBox(
                height: appHight(context, 0.30),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Image.asset(
                            "images/cover.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: Row(
                              children: [
                                Text("Bags", style: AppTexts.small),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_forward_ios, size: 12)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image.asset(
                                  "images/cover.jpg",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  height: 20,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Woman", style: AppTexts.small),
                                      SizedBox(width: 4),
                                      Icon(Icons.arrow_forward_ios, size: 12)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Expanded(
                            child: Stack(
                              alignment: AlignmentDirectional.bottomCenter,
                              children: [
                                Image.asset(
                                  "images/cover.jpg",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  height: 20,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                  ),
                                  child: Row(
                                    children: [
                                      Text("Man", style: AppTexts.small),
                                      SizedBox(width: 4),
                                      Icon(Icons.arrow_forward_ios, size: 12)
                                    ],
                                  ),
                                )
                              ],
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
            //footer
            Container(
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
                          children: _footerLinks(),
                        )
                      else
                        Row(
                          children: _footerLinks(),
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
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> _footerLinks() {
  return [
    TextButton(
        style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.grey)),
        onPressed: () {},
        child: Text("About us", style: TextStyle(color: Colors.white))),
    SizedBox(width: 14),
    TextButton(
        style: ButtonStyle(overlayColor: WidgetStatePropertyAll(Colors.grey)),
        onPressed: () {},
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
