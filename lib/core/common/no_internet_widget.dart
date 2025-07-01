import 'package:flutter/material.dart';
import 'package:flutter_website/core/fonts/app_text.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: isMobile ? 200 : 400,
                  width: isMobile ? 200 : 400,
                  child: Image.asset('images/noconnection.png')),
              SizedBox(height: 20),
              Text(
                'No Internet Connection',
                style: AppTexts.title,
              )
            ],
          ),
        ),
      ),
    );
  }
}
