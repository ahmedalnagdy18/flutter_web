import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/core/routes/navigation_helper.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';
import 'package:flutter_website/injection_container.dart';

class CollectionPage extends StatelessWidget {
  const CollectionPage({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(usecase: sl())..getProducts(),
      child: _CollectionPage(type: type),
    );
  }
}

class _CollectionPage extends StatelessWidget {
  const _CollectionPage({required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int getCrossAxisCount(double width) {
      if (width < 600) return 2; // mobile
      if (width < 1000) return 3; // tablet
      return 4; // desktop
    }

    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is SucsessProducts) {
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
                        itemCount: 11,
                        shrinkWrap: true,
                        // reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: getCrossAxisCount(screenWidth),
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1,
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
