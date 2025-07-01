import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/core/routes/navigation_helper.dart';
import 'package:flutter_website/features/home/presentation/cubits/add_to_cart/add_to_card_cubit.dart';

class AppbarMobileWidget extends StatelessWidget {
  const AppbarMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCardCubit, AddToCardState>(
      builder: (context, state) {
        if (state is CartState) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () => NavigationHelper.goToHomePage(context),
                  child: Text("WEBSITE",
                      style: AppTexts.title.copyWith(fontSize: 18))),
              Spacer(),
              InkWell(
                  onTap: () => NavigationHelper.goToCartPage(context),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Icon(
                        Icons.shopping_basket_outlined,
                        size: 24,
                        color: state.cartItems.isNotEmpty ? Colors.red : null,
                      ),
                      state.cartItems.isNotEmpty
                          ? Container(
                              height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.red),
                              child: Center(
                                child: Text(
                                  "${state.cartItems.length}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  )),
              SizedBox(width: 8),
              InkWell(
                  onTap: () => _showMenuBottomSheet(context),
                  child: Icon(
                    Icons.menu,
                    size: 22,
                  )),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}

void _showMenuBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (_) => Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Men'),
            leading: Icon(Icons.shopping_bag),
            onTap: () {
              Navigator.pop(context);
              NavigationHelper.goToCollection(context, 'Men');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Woman'),
            leading: Icon(Icons.shopping_bag),
            onTap: () {
              Navigator.pop(context);
              NavigationHelper.goToCollection(context, 'Woman');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Account'),
            leading: Icon(Icons.person_2_outlined),
            onTap: () {
              Navigator.pop(context);
              NavigationHelper.goToLoginPage(context);
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Cart'),
            leading: Icon(Icons.shopping_basket_outlined),
            onTap: () {
              Navigator.pop(context);
              NavigationHelper.goToCartPage(context);
            },
          ),
        ],
      ),
    ),
  );
}

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddToCardCubit, AddToCardState>(
      builder: (context, state) {
        if (state is CartState) {
          return Row(
            children: [
              InkWell(
                  onTap: () => NavigationHelper.goToHomePage(context),
                  child: Text("WEBSITE", style: AppTexts.title)),
              const SizedBox(width: 33),
              TextButton(
                  onPressed: () =>
                      NavigationHelper.goToCollection(context, 'Bags'),
                  child: Text(
                    "Bags",
                    style: TextStyle(color: AppColors.primaryColor),
                  )),
              const SizedBox(width: 12),
              TextButton(
                  onPressed: () =>
                      NavigationHelper.goToCollection(context, 'Men'),
                  child: Text(
                    "Men",
                    style: TextStyle(color: AppColors.primaryColor),
                  )),
              const SizedBox(width: 12),
              TextButton(
                  onPressed: () =>
                      NavigationHelper.goToCollection(context, 'Women'),
                  child: Text(
                    "Women",
                    style: TextStyle(color: AppColors.primaryColor),
                  )),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.search_outlined)),
              const SizedBox(width: 12),
              IconButton(
                  onPressed: () {
                    NavigationHelper.goToLoginPage(context);
                  },
                  icon: const Icon(Icons.person_2_outlined)),
              const SizedBox(width: 12),
              Stack(
                alignment: Alignment.topRight,
                children: [
                  IconButton(
                      onPressed: () {
                        NavigationHelper.goToCartPage(context);
                      },
                      icon: Icon(
                        Icons.shopping_basket_outlined,
                        color: state.cartItems.isNotEmpty ? Colors.red : null,
                      )),
                  state.cartItems.isNotEmpty
                      ? Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Center(
                            child: Text(
                              "${state.cartItems.length}",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
