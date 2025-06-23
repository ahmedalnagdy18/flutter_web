import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/app_buttons.dart';
import 'package:flutter_website/core/common/app_textfield.dart';
import 'package:flutter_website/core/common/appbar_common_widget.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/widgets/contact_us_mobile_widget.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    messageController.addListener(_updateButtonState);
    emailController.addListener(_updateButtonState);
    subjectController.addListener(_updateButtonState);
    nameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = messageController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          subjectController.text.isNotEmpty &&
          nameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppbarCommonWidget(title: 'Contact Us'),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: isMobile
                  ? ContactUsMobileWidget()
                  //! tablet and computers
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Information About Us',
                                  style: AppTexts.title,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'descrebtion descrebtion descrebtion descrebtion descrebtion descrebtion\ndescrebtion descrebtion descrebtion descrebtion descrebtion\ndescrebtiondescrebtion descrebtion descrebtion descrebtion descrebtion descrebtion',
                                  style: AppTexts.small
                                      .copyWith(color: AppColors.primaryColor),
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 20,
                                        child: CircleAvatar(
                                            backgroundColor:
                                                Colors.deepPurple)),
                                    SizedBox(width: 6),
                                    SizedBox(
                                        height: 20,
                                        child: CircleAvatar(
                                            backgroundColor: Colors.pink)),
                                    SizedBox(width: 6),
                                    SizedBox(
                                        height: 20,
                                        child: CircleAvatar(
                                            backgroundColor: Colors.lightBlue)),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 50),
                        Expanded(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Contact Way',
                                  style: AppTexts.title,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    SizedBox(
                                        height: 34,
                                        child: CircleAvatar(
                                            backgroundColor:
                                                Colors.deepPurple)),
                                    SizedBox(width: 8),
                                    textSelection(text: 'Tel: 10182839123'),
                                    SizedBox(width: 40),
                                    SizedBox(
                                        height: 34,
                                        child: CircleAvatar(
                                            backgroundColor:
                                                Colors.pinkAccent)),
                                    SizedBox(width: 8),
                                    textSelection(
                                        text: 'Email: nagdy@gmail.com'),
                                  ],
                                ),
                                SizedBox(height: 50),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 34,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.orangeAccent,
                                        )),
                                    SizedBox(width: 8),
                                    textSelection(text: 'Tel: 10182839123'),
                                    SizedBox(width: 40),
                                    SizedBox(
                                        height: 34,
                                        child: CircleAvatar(
                                            backgroundColor:
                                                Colors.deepOrangeAccent)),
                                    SizedBox(width: 8),
                                    textSelection(
                                        text: 'Email: nagdy@gmail.com'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(height: 100),
            isMobile
                ? GetInTouchMobile(
                    emailController: emailController,
                    nameController: nameController,
                    subjectController: subjectController,
                    messageController: messageController,
                    widget: SizedBox(
                      width: 150,
                      child: MainAppButton(
                        textColor: isButtonEnabled
                            ? Colors.white
                            : AppColors.primaryColor,
                        buttonColor: isButtonEnabled
                            ? AppColors.primaryColor
                            : Colors.white,
                        onPressed: isButtonEnabled
                            ? () {
                                messageController.clear();
                                emailController.clear();
                                subjectController.clear();
                                nameController.clear();
                                showToastMessage(message: 'Mail send success');
                              }
                            : null,
                        text: "Send Mail",
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                'Get In Touch',
                                style: AppTexts.title,
                              ),
                              SizedBox(height: 24),
                              Text(
                                'descrebtion descrebtion descrebtion descrebtion descrebtion descrebtion\ndescrebtion descrebtion descrebtion descrebtion descrebtion\ndescrebtiondescrebtion descrebtion descrebtion descrebtion descrebtion descrebtion',
                                style: AppTexts.small
                                    .copyWith(color: AppColors.primaryColor),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFieldWidget(
                                      mycontroller: nameController,
                                      hintText: 'Your name*',
                                    ),
                                  ),
                                  SizedBox(width: 24),
                                  Expanded(
                                    child: TextFieldWidget(
                                      mycontroller: emailController,
                                      hintText: 'Your Email',
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 24),
                              TextFieldWidget(
                                mycontroller: subjectController,
                                hintText: 'Subject*',
                              ),
                              SizedBox(height: 24),
                              TextFieldWidget(
                                mycontroller: messageController,
                                hintText: 'Type Your Message*',
                                maxLines: 6,
                              ),
                              SizedBox(height: 24),
                              SizedBox(
                                width: 150,
                                child: MainAppButton(
                                  textColor: isButtonEnabled
                                      ? Colors.white
                                      : AppColors.primaryColor,
                                  buttonColor: isButtonEnabled
                                      ? AppColors.primaryColor
                                      : Colors.white,
                                  onPressed: isButtonEnabled
                                      ? () {
                                          messageController.clear();
                                          emailController.clear();
                                          subjectController.clear();
                                          nameController.clear();
                                          showToastMessage(
                                              message: 'Mail send success');
                                        }
                                      : null,
                                  text: "Send Mail",
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              maxHeight: 500,
                            ),
                            child: Image.asset(
                              'images/contactus.png',
                            ),
                          ),
                        ),
                      ],
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

Widget textSelection({String? text}) {
  return Flexible(
    child: Text(
      text ?? "",
      style: AppTexts.small.copyWith(color: AppColors.primaryColor),
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    ),
  );
}
