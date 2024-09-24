// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:food_recipe/util.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Effective Date: September 2, 2024',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16),
            Util.textStyleForHeading('1.Introduction'),
            SizedBox(height: 8),
            Util.textStyleForText(
              'Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your data when you use our Recipe App.',
            ),
            SizedBox(height: 16),
            Util.textStyleForHeading(
              'Information We Collect',
            ),
            SizedBox(height: 8),
            Util.textStyleForText(
              'We collect the following information when you use our app:\n'
              '- Personal information such as name, email address (if you create an account)\n'
              '- App usage data such as favorites, search history\n'
              '- Device information such as IP address, operating system, and device type',
            ),
            SizedBox(height: 16),
            Util.textStyleForHeading(
              'How We Use Your Information',
            ),
            SizedBox(height: 8),
            Util.textStyleForText(
              'The information we collect is used to:\n'
              '- Provide and improve our services\n'
              '- Personalize your experience in the app\n'
              '- Respond to customer support requests\n'
              '- Analyze usage to improve app performance',
            ),
            SizedBox(height: 16),
            Util.textStyleForHeading(
              'Sharing Your Information',
            ),
            SizedBox(height: 8),
            Util.textStyleForText(
              'We do not share your personal information with third parties except in the following cases:\n'
              '- When required by law\n'
              '- To protect the rights and safety of our users\n'
              '- With your explicit consent',
            ),
            SizedBox(height: 16),
            Util.textStyleForHeading(
              'Your Rights',
            ),
            SizedBox(height: 8),
            Util.textStyleForText(
              'You have the right to:\n'
              '- Access, update, or delete your personal information\n'
              '- Opt-out of data collection or request limitations on how we use your information\n'
              '- Request more details about the data we collect and how we use it',
            ),
            SizedBox(height: 16),
            Util.textStyleForHeading(
              'Contact Us',
            ),
            SizedBox(height: 8),
            Util.textStyleForText(
              'If you have any questions about this Privacy Policy, please contact us at privacy@recipeapp.com.',
            ),
          ],
        ),
      ),
    );
  }
}
