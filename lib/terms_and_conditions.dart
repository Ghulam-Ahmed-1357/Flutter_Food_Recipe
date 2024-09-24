// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_recipe/dashboard.dart';
import 'package:food_recipe/util.dart';

class TermsAndConditionsPage extends StatefulWidget {
  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool _isChecked = false;

  void _agreeToTerms() {
    if (_isChecked) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: ((context) => Dashboard())), (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Util.textStyleForHeading('1.Introduction'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'Welcome to the Recipe App. These Terms and Conditions govern your use of the app, and by accessing or using our service, you agree to comply with these terms. If you do not agree with any part of these terms, you must not use our service.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('2. Acceptance of Terms'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'By using the Recipe App, you agree to abide by all terms, conditions, and guidelines set forth herein. These terms may be updated by us from time to time without notice, and it is your responsibility to review them periodically.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('3. User Accounts'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'To access certain features of the Recipe App, you may be required to create an account. You must provide accurate and complete information and keep your account login details secure. You are solely responsible for the activity that occurs under your account.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('4. Use of the App'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'You agree to use the Recipe App only for lawful purposes and in accordance with these Terms and Conditions. You must not: \n Use the app for any illegal or unauthorized purpose. \n Attempt to interfere with the app’s functionality or security. \n Upload or transmit any harmful content such as viruses or malicious code.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('5. Content and Intellectual Property'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'All content provided within the Recipe App, including recipes, images, and text, is the intellectual property of Recipe App and its contributors. You may not reproduce, distribute, or create derivative works of any part of the content without express permission.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('6. User-Generated Content'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'The Recipe App allows users to contribute recipes, reviews, and other content. By submitting content to the app, you grant us a non-exclusive, royalty-free, perpetual license to use, display, and modify your content within the app.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('7. Privacy Policy'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'We value your privacy and have outlined how we collect, use, and protect your personal information in our Privacy Policy. By using the app, you consent to the collection and use of information as described in the Privacy Policy.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('8. Limitation of Liability'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'The Recipe App is provided on an "as is" basis, and we make no warranties or guarantees about the accuracy, reliability, or availability of the app. We are not responsible for any damages or losses that may arise from your use of the app.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('9. Modifications to the Service'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'We reserve the right to modify, suspend, or discontinue the app at any time without notice. We are not liable for any changes that may affect your use of the app.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('10. Termination'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'We may suspend or terminate your access to the Recipe App at any time if you breach any of these terms.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('11. Governing Law'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'These Terms and Conditions shall be governed by and construed in accordance with the laws of Pakistan. Any disputes arising from these terms will be resolved in the courts of Pakistan.'),
              SizedBox(height: 16),
              Util.textStyleForHeading('12. Contact Us'),
              SizedBox(height: 8),
              Util.textStyleForText(
                  'If you have any questions about these Terms and Conditions, please contact us at recipeapp@gmail.com.'),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _isChecked = newValue!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      'I agree to the Terms and Conditions',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _isChecked ? _agreeToTerms : null,
                  child: Text('Agree and Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
