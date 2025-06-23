import 'package:flutter/material.dart';
import 'package:flutter_website/core/colors/app_color.dart';
import 'package:flutter_website/core/common/app_textfield.dart';
import 'package:flutter_website/core/fonts/app_text.dart';
import 'package:flutter_website/features/home/presentation/screens/contact_us_page.dart';

class ContactUsMobileWidget extends StatelessWidget {
  const ContactUsMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Information About Us',
          style: AppTexts.title,
        ),
        SizedBox(height: 20),
        Text(
          'descrebtion descrebtion descrebtion descrebtion descrebtion descrebtion\ndescrebtion descrebtion descrebtion descrebtion descrebtion\ndescrebtiondescrebtion descrebtion descrebtion descrebtion descrebtion descrebtion',
          style: AppTexts.small.copyWith(color: AppColors.primaryColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 10, backgroundColor: Colors.deepPurple),
            SizedBox(width: 6),
            CircleAvatar(radius: 10, backgroundColor: Colors.pink),
            SizedBox(width: 6),
            CircleAvatar(radius: 10, backgroundColor: Colors.lightBlue),
          ],
        ),
        SizedBox(height: 40),
        //second col
        Text(
          'Contact Way',
          style: AppTexts.title,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(
                height: 34,
                child: CircleAvatar(backgroundColor: Colors.deepPurple)),
            SizedBox(width: 8),
            textSelection(text: 'Tel: 10182839123'),
            SizedBox(width: 40),
            SizedBox(
                height: 34,
                child: CircleAvatar(backgroundColor: Colors.pinkAccent)),
            SizedBox(width: 8),
            textSelection(text: 'Email: nagdy@gmail.com'),
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
                child: CircleAvatar(backgroundColor: Colors.deepOrangeAccent)),
            SizedBox(width: 8),
            textSelection(text: 'Email: nagdy@gmail.com'),
          ],
        ),
      ],
    );
  }
}

class GetInTouchMobile extends StatelessWidget {
  const GetInTouchMobile(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.subjectController,
      required this.messageController,
      required this.widget});
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController subjectController;
  final TextEditingController messageController;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              maxHeight: 200,
            ),
            child: Image.asset(
              'images/contactus.png',
            ),
          ),
          SizedBox(width: 40),
          Text(
            'Get In Touch',
            style: AppTexts.title,
          ),
          SizedBox(height: 24),
          Text(
            'descrebtion descrebtion descrebtion descrebtion descrebtion descrebtion\ndescrebtion descrebtion descrebtion descrebtion descrebtion\ndescrebtiondescrebtion descrebtion descrebtion descrebtion descrebtion descrebtion',
            style: AppTexts.small.copyWith(color: AppColors.primaryColor),
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: TextFieldWidget(
                  hintText: 'Your name*',
                  mycontroller: nameController,
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
            hintText: 'Subject*',
            mycontroller: subjectController,
          ),
          SizedBox(height: 24),
          TextFieldWidget(
            hintText: 'Type Your Message*',
            mycontroller: messageController,
            maxLines: 6,
          ),
          SizedBox(height: 24),
          widget,
        ],
      ),
    );
  }
}
