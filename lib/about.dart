import 'package:flutter/material.dart';
import 'package:food_recipe/util.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    _getVersionInfo();
  }

  Future<void> _getVersionInfo() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      setState(() {
        _version = packageInfo.version;
      });
    } catch (e) {
      print('Error fetching package info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About the App'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Util.textStyleForHeading(
              'Version:',
            ),
            SizedBox(height: 10),
            Util.textStyleForText(
              'App Version: ${_version}',
            ),
            SizedBox(height: 20),
            Util.textStyleForHeading(
              'Developer Info',
            ),
            SizedBox(height: 10),
            Util.textStyleForText(
              'Developed by Ghulam Ahmed.',
            ),
            SizedBox(height: 20),
            Util.textStyleForHeading(
              'Contact Us',
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
