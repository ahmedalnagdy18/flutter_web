import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/app_buttons.dart';
import 'package:flutter_website/core/common/appbar_common_widget.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/domain/entity/model/product_model.dart';
import 'package:flutter_website/features/home/presentation/cubits/add_to_cart/add_to_card_cubit.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.products});
  final ProductModel products;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final images = widget.products.images ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarCommonWidget(title: 'Product details'),
            SizedBox(height: 70),

            /// ✅ Mobile layout
            if (isMobile)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(images.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImageIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: selectedImageIndex == index
                                      ? AppColors.primaryColor
                                      : Colors.grey.shade300,
                                  width: selectedImageIndex == index ? 3 : 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.network(images[index],
                                  fit: BoxFit.cover),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 12),

                    /// ✅ Large image preview
                    if (images.isNotEmpty)
                      Image.network(images[selectedImageIndex], height: 300),

                    SizedBox(height: 12),
                    Text(widget.products.title ?? "", style: AppTexts.title),
                    SizedBox(height: 12),
                    Text("\$ ${widget.products.price}",
                        style: AppTexts.small
                            .copyWith(color: AppColors.primaryColor)),
                    SizedBox(height: 12),
                    Text(widget.products.description ?? "",
                        style: AppTexts.small),
                    SizedBox(height: 12),
                    MainAppButton(
                      onPressed: () {
                        context
                            .read<AddToCardCubit>()
                            .addItemToCart(widget.products);
                        showToastMessage(
                            message: 'Product added to cart successfully');
                      },
                      text: "Add to cart",
                    ),
                  ],
                ),
              )

            /// ✅ Desktop layout
            else
              Center(
                child: Container(
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  height: appHight(context, isMobile ? 0.50 : 0.30),
                  color: AppColors.lightGrey,
                  child: Row(
                    children: [
                      /// Thumbnails (left column)
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Expanded(
                          flex: 1,
                          child: Column(
                            children: List.generate(images.length, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedImageIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: selectedImageIndex == index
                                          ? AppColors.primaryColor
                                          : Colors.grey.shade300,
                                      width:
                                          selectedImageIndex == index ? 3 : 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Image.network(
                                    images[index],
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),

                      /// Main large image
                      Expanded(
                        flex: 2,
                        child: images.isNotEmpty
                            ? Image.network(images[selectedImageIndex],
                                fit: BoxFit.contain)
                            : const SizedBox(),
                      ),
                      SizedBox(width: 12),

                      /// Product info
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.products.title ?? "",
                                style: AppTexts.title),
                            SizedBox(height: 12),
                            Text("\$ ${widget.products.price}",
                                style: AppTexts.small
                                    .copyWith(color: AppColors.primaryColor)),
                            SizedBox(height: 12),
                            Expanded(
                              child: Text(widget.products.description ?? "",
                                  style: AppTexts.small),
                            ),
                            MainAppButton(
                              onPressed: () {
                                context
                                    .read<AddToCardCubit>()
                                    .addItemToCart(widget.products);
                                showToastMessage(
                                    message:
                                        'Product added to cart successfully');
                              },
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
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
