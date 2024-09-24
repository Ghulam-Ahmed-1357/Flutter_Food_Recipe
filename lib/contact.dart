import 'package:flutter/material.dart';
import 'util.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri url = Uri.parse(
    'https://www.facebook.com/share/uZF17T2d1JbQ9hsz/?mibextid=qi2Omg');

class Contact extends StatelessWidget {
  const Contact({super.key});
  Future<void> _launchUrl() async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Util.textStyleForText('Contact us at: support@recipe.com'),
            Row(
              children: [
                Util.textStyleForText('Phone # 03158147021'),
              ],
            ),
            Row(
              children: [
                Util.textStyleForText('Whatsapp: 03158147021'),
                SizedBox(
                  width: 30,
                ),
                Image.network(
                  'https://tse3.mm.bing.net/th?id=OIP.qeBL7LoMSOxJnY_hd_ZOZgHaHc&pid=Api&P=0&h=220',
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
              ],
            ),
            Row(
              children: [
                Util.textStyleForText('Facebook: '),
                Flexible(
                  child: GestureDetector(
                      onTap: _launchUrl,
                      child: Text(
                        'https://www.facebook.com/share/uZF17T2d1JbQ9hsz/?mibextid=qi2Omg',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      )),
                ),
                SizedBox(
                  width: 30,
                ),
                Image.network(
                  'https://tse3.mm.bing.net/th?id=OIP.Zfn2VjTaDa7TsUoMKzIYgAHaD7&pid=Api&P=0&h=220',
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
