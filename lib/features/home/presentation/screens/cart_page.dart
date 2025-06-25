import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_website/core/common/app_buttons.dart';
import 'package:flutter_website/core/common/appbar_common_widget.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/features/home/presentation/cubits/add_to_cart/add_to_card_cubit.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return BlocBuilder<AddToCardCubit, AddToCardState>(
      builder: (context, state) {
        if (state is! CartState) {
          return const Center(child: CircularProgressIndicator());
        }

        final cartItems = state.cartItems;

        // ✅ Calculate cart total
        final double cartTotal = cartItems.fold(
          0.0,
          (sum, item) => sum + ((item.price ?? 0) * (1)),
        );

        const double shippingCost = 20;
        final double finalTotal = cartTotal + shippingCost;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppbarCommonWidget(title: 'Shopping Cart'),
                const SizedBox(height: 50),

                // Table Header
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 22),
                  child: isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // product table
                            productTable(context),
                            //cart Summary
                            cartSammary(
                                finalTotal:
                                    '\$${finalTotal.toStringAsFixed(2)}',
                                cartTotal: '\$${cartTotal.toStringAsFixed(2)}'),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // product table
                            Expanded(child: productTable(context)),
                            //cart Summary
                            cartSammary(
                                finalTotal:
                                    '\$${finalTotal.toStringAsFixed(2)}',
                                cartTotal: '\$${cartTotal.toStringAsFixed(2)}'),
                          ],
                        ),
                ),
                SizedBox(height: 100),
                FooterWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget productTable(BuildContext context) {
    final state = context.watch<AddToCardCubit>().state;
    final isMobile = MediaQuery.of(context).size.width < 800;

    if (state is! CartState || state.cartItems.isEmpty) {
      return Text('Your cart is empty.', style: AppTexts.small);
    }

    final cartItems = state.cartItems;
    if (isMobile) {
      return Column(
        children: cartItems.map((item) {
          final total = (item.price ?? 0) * (1);
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      item.thumbnail ?? '',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.image_not_supported),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.title ?? '', style: AppTexts.small),
                          const SizedBox(height: 4),
                          Text('Brand: ${item.brand ?? "-"}',
                              style: AppTexts.small),
                          Text('Qty: ${1}', style: AppTexts.small),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price: \$${item.price?.toStringAsFixed(2) ?? "0"}',
                        style: AppTexts.small),
                    Text('Total: \$${total.toStringAsFixed(2)}',
                        style: AppTexts.small),
                  ],
                ),
              ],
            ),
          );
        }).toList(),
      );
    } else {
      return Table(
        columnWidths: const {
          0: FlexColumnWidth(3),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
          3: FlexColumnWidth(1),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Product', style: AppTexts.regularSimiBold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Price', style: AppTexts.regularSimiBold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Quantity', style: AppTexts.regularSimiBold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total', style: AppTexts.regularSimiBold),
              ),
            ],
          ),
          ...cartItems.map((item) {
            final total = (item.price ?? 0) * (1);
            return TableRow(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Row(
                    children: [
                      Image.network(
                        item.thumbnail ?? '',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.image_not_supported),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title ?? '', style: AppTexts.small),
                            Text('Brand: ${item.brand ?? ""}',
                                style: AppTexts.small),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$${item.price?.toStringAsFixed(2) ?? "0"}',
                      style: AppTexts.small),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${1}', style: AppTexts.small),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('\$${total.toStringAsFixed(2)}',
                      style: AppTexts.small),
                ),
              ],
            );
          }),
        ],
      );
    }
  }

  Widget cartSammary({String? finalTotal, String? cartTotal}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Column(
          children: [
            Text('Cart Total', style: AppTexts.regularSimiBold),
            SizedBox(height: 20),
            Container(
              width: 250,
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
              decoration: BoxDecoration(
                color: Color(0xFFF1F8FD),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child:
                              Text('Subtotals:', style: AppTexts.miniRegular)),
                      Flexible(
                          child: Text(cartTotal ?? "",
                              style: AppTexts.miniRegular)),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child:
                              Text('Shipping:', style: AppTexts.miniRegular)),
                      Flexible(
                          child: Text('\$20', style: AppTexts.miniRegular)),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text('Total:', style: AppTexts.miniRegular)),
                      Flexible(
                          child: Text(finalTotal ?? "",
                              style: AppTexts.miniRegular)),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.verified,
                        color: Colors.green,
                        size: 14,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text('Shipping & taxes calculated at cheackout:',
                            style: AppTexts.small),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  MainAppButton(
                    borderColor: Colors.green,
                    buttonColor: Colors.green,
                    onPressed: () {},
                    text: "Checkout",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
