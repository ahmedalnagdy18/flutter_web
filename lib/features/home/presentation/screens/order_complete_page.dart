import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/app_buttons.dart';
import 'package:flutter_website/core/common/appbar_common_widget.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/features/home/presentation/screens/home_page.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppbarCommonWidget(title: 'Order Complete'),
            const SizedBox(height: 50),
            SizedBox(
                height: 250,
                width: 250,
                child: Image.asset('images/payment_done.png')),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Text('Your Order Is Completed',
                        style: AppTexts.midTitle)),
                SizedBox(width: 12),
                Icon(
                  Icons.verified,
                  color: Colors.green,
                )
              ],
            ),
            SizedBox(height: 50),
            SizedBox(
              width: 150,
              child: MainAppButton(
                buttonColor: AppColors.primaryColor,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
                text: "Continue Shopping",
              ),
            ),
            SizedBox(height: 100),
            FooterWidget(),
          ],
        ),
      ),
    );
  }
}
