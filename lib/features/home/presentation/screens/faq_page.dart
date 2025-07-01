import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/app_buttons.dart';
import 'package:flutter_website/core/common/app_textfield.dart';
import 'package:flutter_website/core/common/appbar_common_widget.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/extentions/app_extentions.dart';
import 'package:flutter_website/features/home/presentation/widgets/faq_mobile_page.dart';
import 'package:flutter_website/features/home/presentation/widgets/footer_widget.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    messageController.addListener(_updateButtonState);
    subjectController.addListener(_updateButtonState);
    nameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = messageController.text.isNotEmpty &&
          subjectController.text.isNotEmpty &&
          nameController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
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
          children: [
            AppbarCommonWidget(title: 'FAQ'),
            SizedBox(height: 50),
            isMobile
                ? FaqMobilePage(
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
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('General Information', style: AppTexts.title),
                            SizedBox(height: 50),
                            Text('What is this website about?',
                                style: AppTexts.medium),
                            SizedBox(height: 25),
                            Text(
                              'This platform provides answers to commonly asked questions and allows users to submit their own inquiries for personalized support.',
                              style: AppTexts.small
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            SizedBox(height: 50),
                            Text('How can I submit a question?',
                                style: AppTexts.medium),
                            SizedBox(height: 25),
                            Text(
                              'You can submit your question using the form on the right. Just fill in your name, subject, and message, then click "Send Mail".',
                              style: AppTexts.small
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            SizedBox(height: 50),
                            Text('When will I receive a response?',
                                style: AppTexts.medium),
                            SizedBox(height: 25),
                            Text(
                              'We aim to respond within 24-48 hours. Response time may vary depending on the complexity of your question.',
                              style: AppTexts.small
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            SizedBox(height: 50),
                            Text('Is my personal information safe?',
                                style: AppTexts.medium),
                            SizedBox(height: 25),
                            Text(
                              'Yes, your information is handled securely and is only used to respond to your inquiries. We do not share your data with third parties.',
                              style: AppTexts.small
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        )),
                        SizedBox(width: 100),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 22 : 0),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 600,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F8FD),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Ask a Question',
                                      style: AppTexts.regularSimiBold),
                                  SizedBox(height: 50),
                                  TextFieldWidget(
                                    mycontroller: nameController,
                                    hintText: 'Your Name*',
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
                                      buttonColor: AppColors.primaryColor,
                                      onPressed: isButtonEnabled
                                          ? () {
                                              messageController.clear();
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
