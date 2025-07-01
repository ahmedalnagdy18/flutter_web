import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/app_buttons.dart';
import 'package:flutter_website/core/common/app_textfield.dart';
import 'package:flutter_website/core/common/appbar_common_widget.dart';
import 'package:flutter_website/core/common/no_internet_widget.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/core/utils/internet_connection_mixin.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with InternetConnectionMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;
  bool isObscuretext = true;

  @override
  void initState() {
    super.initState();

    passwordController.addListener(_updateButtonState);
    emailController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled =
          passwordController.text.isNotEmpty && emailController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    if (!hasInternet) {
      return NoInternetWidget();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppbarCommonWidget(title: 'My Account'),
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Container(
                width: 400,
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1,
                      blurStyle: BlurStyle.outer,
                      spreadRadius: 1,
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Login', style: AppTexts.regularSimiBold),
                    SizedBox(height: 8),
                    Text('Please login using account detail bellow.',
                        style: AppTexts.small.copyWith(color: Colors.grey)),
                    SizedBox(height: 20),
                    TextFieldWidget(
                      hintText: 'Email Address',
                      mycontroller: emailController,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(r'\s')),
                      ],
                    ),
                    SizedBox(height: 8),
                    TextFieldWidget(
                      hintText: 'Password',
                      mycontroller: passwordController,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscuretext = !isObscuretext;
                          });
                        },
                        child: Icon(
                          size: 20,
                          color: Colors.grey,
                          isObscuretext
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      obscureText: isObscuretext,
                    ),
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forget password?',
                        style: AppTexts.small.copyWith(color: Colors.grey),
                      ),
                    ),
                    SizedBox(height: 12),
                    MainAppButton(
                      borderColor: isButtonEnabled
                          ? AppColors.primaryColor
                          : Colors.grey,
                      buttonColor: isButtonEnabled
                          ? AppColors.primaryColor
                          : Colors.grey,
                      onPressed: isButtonEnabled ? () {} : null,
                      text: "Login",
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          child: Text('Don\'t have account?',
                              style:
                                  AppTexts.small.copyWith(color: Colors.grey)),
                        ),
                        SizedBox(width: 4),
                        Flexible(
                          child: InkWell(
                            onTap: () {},
                            child: Text('Create account',
                                style: AppTexts.small
                                    .copyWith(color: AppColors.primaryColor)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100),
            isMobile ? FooterWidget() : SizedBox(),
          ],
        ),
      ),
      bottomNavigationBar: isMobile ? null : FooterWidget(),
    );
  }
}
