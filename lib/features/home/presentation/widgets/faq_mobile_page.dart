import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/app_textfield.dart';
import 'package:flutter_website/core/fonts/app_text.dart';

class FaqMobilePage extends StatelessWidget {
  const FaqMobilePage(
      {super.key,
      required this.nameController,
      required this.subjectController,
      required this.messageController,
      required this.widget});
  final TextEditingController nameController;
  final TextEditingController subjectController;
  final TextEditingController messageController;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General Information', style: AppTexts.title),
          SizedBox(height: 50),
          Text('What is this website about?', style: AppTexts.medium),
          SizedBox(height: 25),
          Text(
            'This platform provides answers to commonly asked questions and allows users to submit their own inquiries for personalized support.',
            style: AppTexts.small.copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: 50),
          Text('How can I submit a question?', style: AppTexts.medium),
          SizedBox(height: 25),
          Text(
            'You can submit your question using the form on the right. Just fill in your name, subject, and message, then click "Send Mail".',
            style: AppTexts.small.copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: 50),
          Text('When will I receive a response?', style: AppTexts.medium),
          SizedBox(height: 25),
          Text(
            'We aim to respond within 24-48 hours. Response time may vary depending on the complexity of your question.',
            style: AppTexts.small.copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: 50),
          Text('Is my personal information safe?', style: AppTexts.medium),
          SizedBox(height: 25),
          Text(
            'Yes, your information is handled securely and is only used to respond to your inquiries. We do not share your data with third parties.',
            style: AppTexts.small.copyWith(color: AppColors.primaryColor),
          ),
          SizedBox(height: 50),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 22),
            decoration: BoxDecoration(
              color: Color(0xFFF1F8FD),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Ask a Question', style: AppTexts.regularSimiBold),
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
                widget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
