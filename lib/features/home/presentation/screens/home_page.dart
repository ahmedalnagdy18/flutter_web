import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/no_internet_widget.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/core/routes/navigation_helper.dart';
import 'package:flutter_website/core/utils/internet_connection_mixin.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:flutter_website/features/home/presentation/widgets/appbar_widget.dart';
import 'package:flutter_website/features/home/presentation/widgets/collection_widget.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_website/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(usecase: sl())..getProducts(),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage();

  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> with InternetConnectionMixin {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = MediaQuery.of(context).size.width < 800;
    int getCrossAxisCount(double width) {
      if (width < 600) return 2; // mobile
      if (width < 1000) return 3; // tablet
      return 4; // desktop
    }

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (!hasInternet) {
          return NoInternetWidget();
        }
        if (state is SucsessProducts) {
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
                        padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 22 : 60),
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
                  Center(
                      child:
                          Text("Gear Up. Stand Out.", style: AppTexts.title)),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: isMobile ? 22 : 60),
                    child: Text("Leatest Products", style: AppTexts.title),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: isMobile ? 22 : 60),
                    child: GridView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getCrossAxisCount(screenWidth),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1,
                          mainAxisExtent: 200,
                        ),
                        itemBuilder: (context, index) {
                          final filteredProducts = state.posts
                              .where((product) =>
                                  (product.images?.length ?? 0) >= 3)
                              .toList();

                          final products = filteredProducts[index];

                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            columnCount: getCrossAxisCount(screenWidth),
                            duration: const Duration(milliseconds: 600),
                            child: ScaleAnimation(
                              child: FadeInAnimation(
                                child: InkWell(
                                  onTap: () =>
                                      NavigationHelper.goToProductDetailsPage(
                                          context, products),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Image.network(
                                            (products.images ?? [])
                                                    .firstOrNull ??
                                                '',
                                            fit: BoxFit.contain,
                                            width: double.infinity,
                                          ),
                                        ),
                                        Text(
                                          "${products.title}",
                                          style: AppTexts.small.copyWith(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 2),
                                        Text(
                                          "price \$${products.price}",
                                          style: AppTexts.small.copyWith(
                                              color: AppColors.primaryColor),
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
                  SizedBox(height: 50),
                  // collection part
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: isMobile ? 22 : 60),
                    child: Text("Collection", style: AppTexts.title),
                  ),
                  SizedBox(height: 24),
                  CollectionWidget(),
                  SizedBox(height: 50),
                  Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: isMobile ? 22 : 60),
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
        return SizedBox();
      },
    );
  }
}
